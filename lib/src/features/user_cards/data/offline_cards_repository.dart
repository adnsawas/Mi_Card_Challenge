import 'package:mi_card/src/features/user_cards/data/cards_repository.dart';
import 'package:mi_card/src/features/user_cards/data/fake_user_cards.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';
import 'package:mi_card/src/utils/im_memory_store.dart';

class OfflineCardsRepository implements CardsRepository {
  final _userCards = InMemoryStore<List<UserCard>>(fakeUserCards);

  @override
  Future<void> createUserCard(UserCard userCard) async {
    await Future.delayed(const Duration(seconds: 1));
    final updatedUserCards = _userCards.value.toList();
    updatedUserCards.add(userCard);
    _userCards.value = updatedUserCards;
  }

  @override
  Future<void> deleteUserCard(String userCardId) async {
    await Future.delayed(const Duration(seconds: 1));
    final updatedUserCards =
        _userCards.value.where((card) => userCardId != card.id).toList();
    _userCards.value = updatedUserCards;
  }

  @override
  Future<void> editUserCard(UserCard userCard) async {
    await Future.delayed(const Duration(seconds: 1));
    final indexOfEditedCard = _userCards.value.indexOf(userCard);
    final updatedUserCards =
        _userCards.value.where((card) => card.id == userCard.id).toList();
    updatedUserCards.insert(indexOfEditedCard, userCard);
    _userCards.value = updatedUserCards;
  }

  @override
  Stream<List<UserCard>> watchUserCards() {
    return _userCards.stream;
  }
}
