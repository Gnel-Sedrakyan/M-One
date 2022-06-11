import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/injection.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authStore = getIt<AuthStore>();

  @override
  void initState() {
    super.initState();
    _authStore.checkForAuthState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: const Center(
        child: Text(
          'splash',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authStore.setLogedIn();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
