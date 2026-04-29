import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/features/auth/forgot_password/views/forgot_password_page.dart';
import 'package:msar/src/features/auth/login/views/login_page.dart';
import 'package:msar/src/features/auth/register/views/register_page.dart';
import 'package:msar/src/features/home/views/home_page.dart';
import 'package:msar/src/features/splash/splash_page.dart';

class AppRouter {
  AppRouter(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  late final GoRouter router = GoRouter(
    initialLocation: '/splash',
    refreshListenable: GoRouterRefreshStream(
      _firebaseAuth.authStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SplashPage());
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: RegisterPage());
        },
      ),
      GoRoute(
        path: '/forgot_password',
        name: 'forgot_password',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: ForgotPasswordPage());
        },
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: HomePage());
        },
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = _firebaseAuth.currentUser != null;
      final path = state.uri.path;

      final isSplash = path == '/splash';
      final isAuthRoute = path == '/login' ||
          path == '/register' ||
          path == '/forgot_password';

      if (isSplash) return null;

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }

      if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}