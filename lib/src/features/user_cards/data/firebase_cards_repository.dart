import 'package:mi_card/src/features/user_cards/data/cards_repository.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';

class FirebaseCardsRepository implements CardsRepository {
  @override
  Future<void> createUserCard(UserCard userCard) {
    // TODO: implement createUserCard
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserCard(String userCardId) {
    // TODO: implement deleteUserCard
    throw UnimplementedError();
  }

  @override
  Future<void> editUserCard(UserCard userCard) {
    // TODO: implement editUserCard
    throw UnimplementedError();
  }

  @override
  Stream<List<UserCard>> watchUserCards() {
    // TODO: implement watchUserCards
    throw UnimplementedError();
  }
}
