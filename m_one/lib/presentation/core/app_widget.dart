import 'package:m_one/presentation/core/themes/app_theme.dart';
import 'package:m_one/presentation/routes/core/router.dart';

import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  late CoreRouterDelegate delegate = CoreRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildLightTheme(),
      darkTheme: AppTheme.buildDarkTheme(),
      themeMode: ThemeMode.system,
      // TODO backbuttondispatcher for android's back button
      home: Router(
        routerDelegate: delegate,
      ),
    );
  }
}
