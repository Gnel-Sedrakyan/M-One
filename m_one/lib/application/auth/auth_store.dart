import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:m_one/domain/auth/i_auth_facade.dart';
import 'package:m_one/domain/auth/value_objects.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

enum LoggedInState { initial, loggedIn, loggedOut }
enum AuthMode { login, signUp }

@lazySingleton
class AuthStore extends _AuthStoreBase with _$AuthStore {
  final IAuthFacade authFacade;
  AuthStore({
    required this.authFacade,
  }) : super(authFacade: authFacade);
}

abstract class _AuthStoreBase with Store {
  final IAuthFacade authFacade;
  _AuthStoreBase({required this.authFacade});

  @observable
  LoggedInState loggedInState = LoggedInState.initial;

  @action
  void setLogedIn() {
    log(loggedInState.name);

    loggedInState = LoggedInState.loggedIn;
  }

  @action
  Future<void> logOut() async {
    log(loggedInState.name);

    loggedInState = LoggedInState.loggedOut;
    await authFacade.signOut();
  }

  @action
  Future<void> checkForAuthState() async {
    final userOption = await authFacade.getSignedInUser();
    loggedInState = userOption.fold(
      () => LoggedInState.loggedOut,
      (user) => LoggedInState.loggedIn,
    );
  }

  // TODO seperate to other store

  @observable
  bool loading = false;

  @observable
  AuthMode authMode = AuthMode.login;

  @observable
  Email _email = Email("");
  @computed
  Email get email => _email;
  @observable
  Username _username = Username("");
  @computed
  Username get username => _username;
  @observable
  Password _password = Password("");
  @computed
  Password get password => _password;

  @observable
  bool showErrors = false;

  @action
  void setEmail(String value) => _email = Email(value);
  @action
  void setUsername(String value) => _username = Username(value);
  @action
  void setPassword(String value) => _password = Password(value);

  @action
  Future<void> login() async {
    log('message');
    showErrors = true;
    if (isFormValid) {
      loading = true;

      final userOptions = await authFacade.signInWithUsernameAndPassword(
          username: username, password: password);
      userOptions.fold((l) => {}, (r) async {
        await checkForAuthState();
        _email = Email('');
        _username = Username('');
        _password = Password('');
        showErrors = false;
      });
      loading = false;
    }
  }

  @action
  Future<void> signUp() async {
    log('message');
    showErrors = true;
    if (isFormValid) {
      loading = true;

      final userOptions =
          await authFacade.registerWithEmailAndUsernameAndPassword(
              username: username, password: password, email: email);
      log('registration complete');
      userOptions.fold((l) => {}, (r) async {
        await checkForAuthState();
        _email = Email('');
        _username = Username('');
        _password = Password('');
        showErrors = false;
      });
      loading = false;
    }
  }

  @action
  void switchToLogin() {
    showErrors = false;
    authMode = AuthMode.login;
  }

  @action
  void switchToSuigUp() {
    showErrors = false;
    authMode = AuthMode.signUp;
  }

  @computed
  bool get isFormValid =>
      username.isValid() &&
      password.isValid() &&
      (email.isValid() ||
          authMode == AuthMode.login); // if mode is login email is not needed
}
