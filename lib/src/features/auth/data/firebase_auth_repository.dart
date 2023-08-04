import 'package:mi_card/src/features/auth/data/auth_repository.dart';
import 'package:mi_card/src/features/auth/models/app_user.dart';

class FirebaseAuthRepository extends AuthRepository {
  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Stream<AppUser?> authStateChanges() => user.stream;
}
