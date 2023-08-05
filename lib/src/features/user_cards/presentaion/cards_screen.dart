import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_card/src/common_widgets/async_value_widget.dart';
import 'package:mi_card/src/common_widgets/empty_place_holder_widget.dart';
import 'package:mi_card/src/common_widgets/error_message_widget.dart';
import 'package:mi_card/src/constants/card_templates_mapping.dart';
import 'package:mi_card/src/core/routing/go_router.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_1.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_2.dart';
import 'package:mi_card/src/features/user_cards/data/cards_repository.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';
import 'package:mi_card/src/utils/localization_extension.dart';

class CardsScreen extends ConsumerWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCards = ref.watch(userCardsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.homeScreen),
        actions: [
          IconButton(
              onPressed: () => context.goNamed(AppRoute.playground.name),
              icon: const Icon(Icons.local_play))
        ],
      ),
      body: AsyncValueWidget<List<UserCard>>(
        asyncValue: userCards,
        data: (cards) => cards.isNotEmpty
            ? ListView.separated(
                itemCount: cards.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 2,
                  height: 0,
                ),
                itemBuilder: (context, index) {
                  final card = cards[index];
                  final cardTemplate =
                      switch (cardTemplatesMapping[card.templateId]!) {
                    CardTemplate1 => CardTemplate1(card.data),
                    CardTemplate2 => CardTemplate2(card.data),
                    _ => null
                  };

                  return Dismissible(
                    key: Key(cards[index].id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.delete),
                          )),
                    ),
                    onDismissed: (_) => ref
                        .read(cardsRepositoryProvider)
                        .deleteUserCard(cards[index].id),
                    child: cardTemplate == null
                        ? Text('no card template found')
                        : Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                  // width:
                                  //     MediaQuery.of(context).size.width * 0.7,
                                  height: 200,
                                  child: FittedBox(child: cardTemplate)),
                            ),
                          ),
                  );
                },
              )
            : const EmptyPlaceholderWidget(),
        onError: (context, error, st) => ErrorMessageWidget(
          error.toString(),
          refresh: () => ref.refresh(userCardsProvider),
        ),
      ),
    );
  }
}
