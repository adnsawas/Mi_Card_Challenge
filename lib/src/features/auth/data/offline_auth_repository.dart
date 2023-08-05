import 'package:mi_card/src/features/auth/data/auth_repository.dart';
import 'package:mi_card/src/features/auth/models/app_user.dart';

class OfflineAuthRepository extends AuthRepository {
  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    user.value = AppUser(email: email, uid: email.split('').reversed.join());
  }

  @override
  Future<void> signInAnonymously() async {
    await Future.delayed(const Duration(seconds: 1));
    user.value = AppUser(email: 'test@test.com', uid: '123');
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    user.value = null;
  }

  @override
  Stream<AppUser?> authStateChanges() => user.stream;
}
