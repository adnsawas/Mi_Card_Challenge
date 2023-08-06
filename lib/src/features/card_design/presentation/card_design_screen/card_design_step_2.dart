import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/constants/card_templates_mapping.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_controller.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_1.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_2.dart';

/// In this step, user selects a card design template
class CardDesignStep2 extends ConsumerStatefulWidget {
  const CardDesignStep2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CardDesignStep2State();
}

class _CardDesignStep2State extends ConsumerState<CardDesignStep2> {
  @override
  Widget build(BuildContext context) {
    final cardDesign = ref.watch(cardDesignScreenControllerProvider).value!;
    return ListView.separated(
      itemCount: cardTemplatesMapping.length,
      separatorBuilder: (context, index) => const Divider(
        thickness: 2,
        height: 0,
      ),
      itemBuilder: (context, index) {
        final cardTemplate =
            switch (cardTemplatesMapping.values.elementAt(index)) {
          CardTemplate1 => CardTemplate1(cardDesign.personDetails!),
          CardTemplate2 => CardTemplate2(cardDesign.personDetails!),
          _ => null
        };
        return Material(
          child: InkWell(
            onTap: () {
              ref
                  .read(cardDesignScreenControllerProvider.notifier)
                  .setCardTemplate(cardTemplatesMapping.keys.elementAt(index));
            },
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FittedBox(
                  child: cardTemplate,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
