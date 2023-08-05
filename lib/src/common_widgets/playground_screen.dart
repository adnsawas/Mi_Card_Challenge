import 'package:flutter/material.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template_2.dart';
import 'package:mi_card/src/features/user_cards/data/fake_user_cards.dart';

class PlayGroundScreen extends StatelessWidget {
  const PlayGroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playground')),
      body: Center(
        child: CardTemplate2(fakeUserCards[0].data),
      ),
    );
  }
}
