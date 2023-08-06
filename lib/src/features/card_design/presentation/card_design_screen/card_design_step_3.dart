import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/constants/card_templates_mapping.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_controller.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_1.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_2.dart';

/// In this step, user see a preview of the buisness card before saving it
class CardDesignStep3 extends ConsumerStatefulWidget {
  const CardDesignStep3({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CardDesignStep3State();
}

class _CardDesignStep3State extends ConsumerState<CardDesignStep3> {
  @override
  Widget build(BuildContext context) {
    final cardDesign = ref.watch(cardDesignScreenControllerProvider).value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Builder(
          builder: (context) {
            final cardTemplate =
                switch (cardTemplatesMapping[cardDesign.selectedTemplate]) {
              CardTemplate1 => CardTemplate1(cardDesign.personDetails!),
              CardTemplate2 => CardTemplate2(cardDesign.personDetails!),
              _ => null
            };
            return SizedBox(
              // height: 200,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FittedBox(
                  child: cardTemplate,
                ),
              ),
            );
          },
        )),
        ElevatedButton(
            onPressed: () => ref
                .read(cardDesignScreenControllerProvider.notifier)
                .saveCard(),
            child: Text('Save Buisness Card')),
      ],
    );
  }
}
