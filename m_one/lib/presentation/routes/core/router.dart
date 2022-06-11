import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/presentation/routes/auth/pages.dart';

import '../../../injection.dart';

class CoreRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final _authStore = getIt<AuthStore>();
  // LoggedInState loggedInState;
  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  CoreRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  getSackByLoggedInState(LoggedInState loggedInState) {
    if (loggedInState == LoggedInState.initial) {
      return _splashStack;
    }
    if (loggedInState == LoggedInState.loggedOut) {
      return _loggedOutStack;
    }
    return _loggedInStack;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Navigator(
          key: navigatorKey,
          pages: getSackByLoggedInState(_authStore.loggedInState),
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            return true;
          },
        );
      },
    );
  }

  List<Page> get _splashStack => [const SplashPage()];

  List<Page> get _loggedOutStack => [const AuthPage()];

  List<Page> get _loggedInStack {
    return [
      const HomePage(),
    ];
  }

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do Nothing */}
}
