import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:accounts/accounts.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class FinancesApp extends ConsumerWidget {
  const FinancesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: AccountRoutes.createAccountView,
              path: AccountRoutes.createAccountView,
              builder: (context, state) => const AddAccountView(),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finances',
      theme: appTheme,
      routerConfig: router,
    );
  }
}


