import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/core/routing/go_router.dart';
import 'package:mi_card/src/features/card_design/models/card_design.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_page_index_provider.dart';
import 'package:mi_card/src/features/user_cards/data/cards_repository.dart';
import 'package:mi_card/src/features/user_cards/models/person_details.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';

class CardDesignScreenControllerNotifier
    extends AutoDisposeAsyncNotifier<CardDesign> {
  @override
  Future<CardDesign> build() async {
    return CardDesign();
  }

  void setPersonalDetails(PersonDetails personDetails) {
    state =
        AsyncValue.data(state.value!.copyWith(personDetails: personDetails));
    // Go to next step in card design
    // After submitting personal details, we move to step 2
    ref.read(cardScreenPageIndexProvider.notifier).state++;
  }

  void setCardTemplate(String template) {
    state = AsyncValue.data(state.value!.copyWith(selectedTemplate: template));
    // After submitting personal details, we move to step 3
    ref.read(cardScreenPageIndexProvider.notifier).state++;
  }

  Future<void> saveCard() async {
    state = const AsyncLoading();
    try {
      await ref.read(cardsRepositoryProvider).createUserCard(UserCard(
          id: '',
          templateId: state.value!.selectedTemplate!,
          data: state.value!.personDetails!));
      state = AsyncValue.data(state.value!);

      // After successfully saving the card.
      // Go to cards screen
      ref.read(goRouterProvider).goNamed(AppRoute.cards.name);
    } catch (e, st) {
      state = AsyncError(e.toString(), st);
    }
  }
}

final cardDesignScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
    CardDesignScreenControllerNotifier,
    CardDesign>(CardDesignScreenControllerNotifier.new);
