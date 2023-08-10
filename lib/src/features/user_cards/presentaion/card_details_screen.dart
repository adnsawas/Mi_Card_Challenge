import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/constants/card_templates_mapping.dart';
import 'package:mi_card/src/constants/cards_shadow.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_1.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_2.dart';
import 'package:mi_card/src/features/user_cards/data/cards_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CardDetailsScreen extends ConsumerWidget {
  const CardDetailsScreen({required this.userCardId, super.key});

  final String userCardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCard = ref.watch(userCardProvider(userCardId));
    final screenshotController = ScreenshotController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details'),
        actions: [
          IconButton(
              onPressed: () async {
                // create the image file
                final tempDirectory = await getTemporaryDirectory();
                final imagePath = await screenshotController
                    .captureAndSave(tempDirectory.path, fileName: 'card.png');
                final file = XFile(imagePath!);
                Share.shareXFiles([file]);
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Builder(
        builder: (context) {
          final cardTemplate =
              switch (cardTemplatesMapping[userCard.templateId]) {
            CardTemplate1 => CardTemplate1(
                userCard.data,
                withShadow: false,
              ),
            CardTemplate2 => CardTemplate2(
                userCard.data,
                withShadow: false,
              ),
            _ => null
          };
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: cardShadows),
              child: FittedBox(
                child: Screenshot(
                  controller: screenshotController,
                  child: cardTemplate,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
