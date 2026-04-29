import 'package:flutter/material.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/core/routing/app_router.dart';
import 'package:msar/src/core/theme/app_theme.dart';

class MsarApp extends StatelessWidget {
  const MsarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(sl()).router;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'msar_app',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: const Locale('ar'),
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      routerConfig: router,
    );
  }
}