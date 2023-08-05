import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/features/auth/data/auth_repository.dart';
import 'package:mi_card/src/core/routing/go_router.dart';

class SplashScreenControllerNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    /// The Splash screen works like this:
    /// Initialize the Authentication Service
    /// - If it works, go to home screen
    /// - If it fails or timeout, go to login screen
    return waitForUserLoginStatus();
  }

  Future<void> waitForUserLoginStatus() async {
    state = const AsyncLoading();
    try {
      /// This wait for either the authentincation service to initialize with
      /// a timeout of 2 seconds. This means the user will see the splash screen
      /// for a maximum of the specified timeout duration. After that, the app
      /// assumes that the user is not signed in
      await Future.delayed(const Duration(seconds: 1));
      final user = await ref.read(currentUserProvider.future);

      // Everything is fine, navigate to home screen
      state = const AsyncData(null);
      ref
          .read(goRouterProvider)
          .goNamed(user == null ? AppRoute.signIn.name : AppRoute.cards.name);
    } catch (_) {
      // state is AsyncError
      // Since there is an error with token, navigate to login screen
      ref.read(goRouterProvider).goNamed(AppRoute.signIn.name);
    }
  }
}

final splashScreenControllerProvider =
    AsyncNotifierProvider.autoDispose<SplashScreenControllerNotifier, void>(
        SplashScreenControllerNotifier.new);
