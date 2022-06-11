import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/injection.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _authStore = getIt<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: const Center(
        child: Text(
          'HOME!!!!! you loged in',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authStore.logOut();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
