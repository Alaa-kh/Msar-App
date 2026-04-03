import 'package:go_router/go_router.dart';
import 'package:msar/src/core/storage/token_storage.dart';
import 'package:msar/src/features/auth/forgot_password/views/forgot_password_page.dart';
import 'package:msar/src/features/auth/login/views/login_page.dart';
import 'package:msar/src/features/auth/register/views/register_page.dart';
import 'package:msar/src/features/home/views/home_page.dart';
import 'package:msar/src/features/splash/splash_page.dart';

class AppRouter {
  AppRouter(this.storage);
  final TokenStorage storage;

  late final GoRouter router = GoRouter(
    // navigatorKey: AppOverlay.navigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (_, __) => const NoTransitionPage(child: SplashPage()),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (_, __) => const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder: (_, __) => const NoTransitionPage(child: RegisterPage()),
      ),
      GoRoute(
        path: '/forgot_password',
        name: 'forgot_password',
        pageBuilder: (_, __) =>
            const NoTransitionPage(child: ForgotPasswordPage()),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (_, __) => const NoTransitionPage(child: HomePage()),
      ),
      //   ],
      //   redirect: (context, state) async {
      //     final user = await UserBox().readUser();
      //     final logged = user != null;

      //     final seenOnboarding = await storage.getOnboardingSeen();

      //     final location = state.matchedLocation;

      //     const publicRoutes = <String>{
      //       '/onboarding',
      //       '/login',
      //       '/register',
      //       '/register_map',
      //       '/reset-password',
      //       '/verify',
      //       '/verify_account',
      //       '/new-password',
      //       '/support',
      //     };

      //     if (!logged && !seenOnboarding && location != '/onboarding') {
      //       return '/onboarding';
      //     }

      //     if (logged &&
      //         (location == '/login' ||
      //             location == '/onboarding' ||
      //             location == '/register')) {
      //       return '/';
      //     }

      //     if (!logged && !publicRoutes.contains(location)) {
      //       return '/login';
      //     }

      //     return null;
      //   },
      // );
    ],
  );
}
