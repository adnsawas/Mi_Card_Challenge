import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/common_widgets/page_view_index_indicator.dart';
import 'package:mi_card/src/constants/gaps.dart';
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
    final currentIndex = ref.watch(cardScreenPageIndexProvider);
    ref.listen(cardScreenPageIndexProvider,
        (_, currentPageIndex) => pageController.jumpToPage(currentPageIndex));
    return Scaffold(
      appBar: AppBar(title: Text(_getStepTitle(currentIndex))),
      body: SafeArea(
        child: Column(
          children: [
            gapH16,
            PageViewIndexIndicator(
              length: 3,
              currentIndex: currentIndex,
              onTap: (index) =>
                  ref.read(cardScreenPageIndexProvider.notifier).state = index,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) => ref
                    .read(cardScreenPageIndexProvider.notifier)
                    .state = value,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: switch (index) {
                          0 => const CardDesignStep1(),
                          1 => const CardDesignStep2(),
                          2 => const CardDesignStep3(),
                          _ => const CardDesignStep1()
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStepTitle(int index) {
    return switch (index) {
      0 => 'Fill Personal Info',
      1 => 'Select a template',
      2 => 'Preview',
      _ => 'Design your card'
    };
  }
}
