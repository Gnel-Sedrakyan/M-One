import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:m_one/injection.dart';
import 'package:m_one/presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.test); // test|prod
  runApp(AppWidget());
}
