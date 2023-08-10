import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/core/offline_provider.dart';
import 'package:mi_card/src/features/user_cards/data/firebase_cards_repository.dart';
import 'package:mi_card/src/features/user_cards/data/offline_cards_repository.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';

abstract class CardsRepository {
  Stream<List<UserCard>> watchUserCards();
  Future<void> createUserCard(UserCard userCard);
  Future<void> editUserCard(UserCard userCard);
  Future<void> deleteUserCard(String userCardId);
}

final cardsRepositoryProvider = Provider<CardsRepository>((ref) {
  final isOffline = ref.watch(offlineModeProvider);
  if (isOffline) {
    return OfflineCardsRepository();
  } else {
    return FirebaseCardsRepository();
  }
});

final userCardsProvider = StreamProvider<List<UserCard>>((ref) {
  final cardsRepository = ref.watch(cardsRepositoryProvider);
  return cardsRepository.watchUserCards();
});

final userCardProvider = Provider.family<UserCard, String>((ref, cardId) {
  return ref
      .watch(userCardsProvider)
      .value!
      .singleWhere((card) => card.id == cardId);
});
