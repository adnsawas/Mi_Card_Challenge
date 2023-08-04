import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_card/src/features/auth/data/auth_repository.dart';
import 'package:mi_card/src/features/auth/presentation/sign_in_screen.dart';
import 'package:mi_card/src/features/splash/presentation/splash_screen.dart';
import 'package:mi_card/src/features/user_cards/presentaion/cards_screen.dart';
import 'package:mi_card/src/routing/router_refresh_stream.dart';

enum AppRoute { splash, signIn, cards, createCard }

final goRouterProvider = Provider<GoRouter>((ref) {
  // Watch current user state so we update the router when user logs in and out
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) {
      final userIsLoggedIn = authRepository.user.value != null;
      final userIsLoggingIn = state.fullPath == '/signIn';

      // Determine where to redirect the user depending on user login status
      // and where the user is navigating
      if (userIsLoggingIn && userIsLoggedIn) {
        return '/cards';
      } else if (userIsLoggingIn && !userIsLoggedIn) {
        return null;
      } else if (!userIsLoggingIn && userIsLoggedIn) {
        return null;
      } else {
        return '/';
      }
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/cards',
        name: AppRoute.cards.name,
        builder: (context, state) => const CardsScreen(),
      ),
    ],
  );
});
