import 'dart:developer';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/injection.dart';

import 'package:flutter/material.dart';
import 'package:m_one/presentation/widgets/auth/toggle_button.dart';
import 'package:m_one/presentation/widgets/auth/validated_text_field.dart';
import 'package:mobx/mobx.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late List<ReactionDisposer> _disposers;
  // For showing a SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _authStore = getIt<AuthStore>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers = [
      reaction(
        // Tell the reaction which observable to observe
        (_) => _authStore.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          _scaffoldKey.currentState?.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
      reaction(
        // Tell the reaction which observable to observe
        (_) => _authStore.showErrors,
        // Run some logic with the content of the observed field
        (bool message) {
          autovalidateMode = _authStore.showErrors
              ? AutovalidateMode.always
              : AutovalidateMode.disabled;
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO localize texts
    return Form(
      autovalidateMode: autovalidateMode,
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Theme.of(context).brightness == Brightness.dark
                            ? const AssetImage('assets/images/bg-dark.png')
                            : const AssetImage('assets/images/bg-light.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 55, 0, 0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Observer(builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    child: child,
                    position: Tween<Offset>(
                            begin: const Offset(-0.0, -10.0),
                            end: const Offset(0.0, 0.0))
                        .animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0.0, 1.0),
                      ),
                    ),
                  );
                },
                child: Visibility(
                  key: ValueKey<AuthMode>(_authStore.authMode),
                  visible: _authStore.authMode == AuthMode.signUp,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _authStore.authMode == AuthMode.signUp ? 1 : 0,
                    child: ValidatedTextField(
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
                    ),
                  ),
                ),
              );
            }),
            // Observer(builder: (_) {
            //   return AnimatedScale(
            //     alignment: Alignment.bottomCenter,
            //     duration: const Duration(milliseconds: 300),
            //     scale: _authStore.authMode == AuthMode.signUp ? 1 : 0,
            //     child: ValidatedTextField(
            //       validator: () => _authStore.email.value.fold(
            //         (f) => f.maybeMap(
            //           invalidEmail: (_) => 'Invalid Email',
            //           unfilledEmail: (_) => 'Email must be filled',
            //           orElse: () => null,
            //         ),
            //         (_) => null,
            //       ),
            //       onChanged: _authStore.setEmail,
            //       labelText: 'Email',
            //       showErrors: _authStore.showErrors,
            //     ),
            //   );
            // }),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    child: child,
                    position: Tween<Offset>(
                            begin: const Offset(-0.0, -10.0),
                            end: const Offset(0.0, 0.0))
                        .animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0.0, 0.9),
                      ),
                    ),
                  );
                },
                child: ValidatedTextField(
                  key: ValueKey<AuthMode>(_authStore.authMode),
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
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    child: child,
                    position: Tween<Offset>(
                            begin: const Offset(-0.0, -10.0),
                            end: const Offset(0.0, 0.0))
                        .animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0.0, 0.8),
                      ),
                    ),
                  );
                },
                child: ValidatedTextField(
                  key: ValueKey<AuthMode>(_authStore.authMode),
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
                ),
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
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: null,
                child: Text('Forgot password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
