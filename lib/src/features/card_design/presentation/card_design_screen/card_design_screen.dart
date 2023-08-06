import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_controller.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_page_index_provider.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_step_1.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_step_2.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_step_3.dart';

class CardDesignScreen extends ConsumerStatefulWidget {
  const CardDesignScreen({super.key});

  @override
  ConsumerState<CardDesignScreen> createState() => _CardDesignScreenState();
}

class _CardDesignScreenState extends ConsumerState<CardDesignScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(cardDesignScreenControllerProvider);
    ref.listen(cardScreenPageIndexProvider,
        (_, currentPageIndex) => pageController.jumpToPage(currentPageIndex));
    return Scaffold(
      appBar: AppBar(title: Text('Design your card')),
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (value) =>
            ref.read(cardScreenPageIndexProvider.notifier).state = value,
        itemCount: 3,
        itemBuilder: (_, index) {
          return switch (index) {
            0 => const CardDesignStep1(),
            1 => const CardDesignStep2(),
            2 => const CardDesignStep3(),
            _ => const CardDesignStep1()
          };
        },
      ),
    );
  }
}
