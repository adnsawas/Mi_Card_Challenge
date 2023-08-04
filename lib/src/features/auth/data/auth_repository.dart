import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/core/offline_provider.dart';
import 'package:mi_card/src/features/auth/data/firebase_auth_repository.dart';
import 'package:mi_card/src/features/auth/data/offline_auth_repository.dart';
import 'package:mi_card/src/features/auth/models/app_user.dart';
import 'package:mi_card/src/utils/im_memory_store.dart';

abstract class AuthRepository {
  InMemoryStore<AppUser?> user = InMemoryStore<AppUser?>(null);

  Future<void> signIn({required String email, required String password});
  Future<void> signInAnonymously();
  Future<void> signOut();
  Stream<AppUser?> authStateChanges();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final isOffline = ref.watch(offlineModeProvider);
  if (isOffline) {
    return OfflineAuthRepository();
  } else {
    return FirebaseAuthRepository();
  }
});

final currentUserProvider = StreamProvider<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges().timeout(const Duration(seconds: 5));
});
