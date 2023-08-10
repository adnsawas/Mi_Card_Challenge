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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(AppRoute.createCard.name),
        child: const Icon(Icons.add),
      ),
      body: AsyncValueWidget<List<UserCard>>(
        asyncValue: userCards,
        data: (cards) => cards.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  final cardTemplate =
                      switch (cardTemplatesMapping[card.templateId]!) {
                    CardTemplate1 => CardTemplate1(card.data),
                    CardTemplate2 => CardTemplate2(card.data),
                    _ => null
                  };

                  return cardTemplate == null
                      ? Text('no card template found')
                      : GestureDetector(
                          onTap: () => context.goNamed(
                              AppRoute.cardDetails.name,
                              pathParameters: {'userCardId': card.id}),
                          child: Card(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: FittedBox(
                                      child: cardTemplate,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: IconButton(
                                      onPressed: () => ref
                                          .read(cardsRepositoryProvider)
                                          .deleteUserCard(cards[index].id),
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
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
