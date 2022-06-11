import 'package:flutter/material.dart';
import 'package:m_one/presentation/pages/auth/auth_screen.dart';
import 'package:m_one/presentation/pages/auth/home_screen.dart';
import 'package:m_one/presentation/pages/auth/splash_screen.dart';

class AuthPage extends Page {
  const AuthPage() : super(key: const ValueKey('AuthPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AuthScreen();
      },
    );
  }
}

class SplashPage extends Page {
  const SplashPage() : super(key: const ValueKey('SplashPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return SplashScreen();
      },
    );
  }
}

class HomePage extends Page {
  const HomePage() : super(key: const ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen();
      },
    );
  }
}
