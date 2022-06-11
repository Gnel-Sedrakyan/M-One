import 'dart:developer';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/injection.dart';

import 'package:flutter/material.dart';
import 'package:m_one/presentation/widgets/auth/rounded_text_field.dart';
import 'package:m_one/presentation/widgets/auth/toggle_button.dart';
import 'package:m_one/presentation/widgets/auth/validated_text_field.dart';
import 'package:mobx/mobx.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final _authStore = getIt<AuthStore>();

  @override
  Widget build(BuildContext context) {
    // TODO localize texts
    return Observer(
      builder: (_) => Form(
        autovalidateMode: _authStore.showErrors
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Scaffold(
          body: Column(
            children: [
              if (_authStore.authMode == AuthMode.signUp)
                Observer(builder: (_) {
                  return ValidatedTextField(
                    validator: () => _authStore.email.value.fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        unfilledEmail: (_) => 'Email must be filled',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                    onChanged: _authStore.setEmail,
                    labelText: 'Email',
                    showErrors: _authStore.showErrors,
                  );
                }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ValidatedTextField(
                  validator: () => _authStore.username.value.fold(
                    (f) => f.maybeMap(
                      unfilledUsername: (_) => 'Username must be filled',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
                  onChanged: _authStore.setUsername,
                  labelText: 'Username',
                  showErrors: _authStore.showErrors,
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ValidatedTextField(
                  validator: () => _authStore.password.value.fold(
                    (f) => f.maybeMap(
                      hasNoTwoUppercaseLetters: (_) =>
                          'Must contain al least two Uppercase letters',
                      hasNoSpecialcaseLetters: (_) =>
                          'Must contain special characters',
                      hasNoTwoDigitsRegex: (_) =>
                          'Must contain at least 2 digits',
                      hasNoThreeLowercaseLettersRegex: (_) =>
                          'Must contain at least 3 Lowercase letters',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
                  onChanged: _authStore.setPassword,
                  labelText: 'Password',
                  showErrors: _authStore.showErrors,
                );
              }),
              const SizedBox(
                height: 30,
              ),
              ToggleButton(
                width: MediaQuery.of(context).size.width - 50,
                height: 40.0,
                toggleBackgroundColor: Theme.of(context).colorScheme.surface,
                toggleColor: (Theme.of(context).colorScheme.primary),
                activeTextColor: Theme.of(context).colorScheme.onPrimary,
                inactiveTextColor: Theme.of(context).colorScheme.onSurface,
                leftDescription: 'Login',
                rightDescription: 'Sign up',
                onPressLeft: _authStore.login,
                onPressRight: _authStore.signUp,
                onLeftToggleActive: _authStore.switchToSuigUp,
                onRightToggleActive: _authStore.switchToLogin,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _authStore.setLogedIn();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
