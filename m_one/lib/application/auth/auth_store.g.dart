// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<Email>? _$emailComputed;

  @override
  Email get email => (_$emailComputed ??=
          Computed<Email>(() => super.email, name: '_AuthStoreBase.email'))
      .value;
  Computed<Username>? _$usernameComputed;

  @override
  Username get username =>
      (_$usernameComputed ??= Computed<Username>(() => super.username,
              name: '_AuthStoreBase.username'))
          .value;
  Computed<Password>? _$passwordComputed;

  @override
  Password get password =>
      (_$passwordComputed ??= Computed<Password>(() => super.password,
              name: '_AuthStoreBase.password'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AuthStoreBase.isFormValid'))
          .value;

  late final _$errorMessageAtom =
      Atom(name: '_AuthStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loggedInStateAtom =
      Atom(name: '_AuthStoreBase.loggedInState', context: context);

  @override
  LoggedInState get loggedInState {
    _$loggedInStateAtom.reportRead();
    return super.loggedInState;
  }

  @override
  set loggedInState(LoggedInState value) {
    _$loggedInStateAtom.reportWrite(value, super.loggedInState, () {
      super.loggedInState = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AuthStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$authModeAtom =
      Atom(name: '_AuthStoreBase.authMode', context: context);

  @override
  AuthMode get authMode {
    _$authModeAtom.reportRead();
    return super.authMode;
  }

  @override
  set authMode(AuthMode value) {
    _$authModeAtom.reportWrite(value, super.authMode, () {
      super.authMode = value;
    });
  }

  late final _$_emailAtom =
      Atom(name: '_AuthStoreBase._email', context: context);

  @override
  Email get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(Email value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_usernameAtom =
      Atom(name: '_AuthStoreBase._username', context: context);

  @override
  Username get _username {
    _$_usernameAtom.reportRead();
    return super._username;
  }

  @override
  set _username(Username value) {
    _$_usernameAtom.reportWrite(value, super._username, () {
      super._username = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: '_AuthStoreBase._password', context: context);

  @override
  Password get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(Password value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_AuthStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$logOutAsyncAction =
      AsyncAction('_AuthStoreBase.logOut', context: context);

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  late final _$checkForAuthStateAsyncAction =
      AsyncAction('_AuthStoreBase.checkForAuthState', context: context);

  @override
  Future<void> checkForAuthState() {
    return _$checkForAuthStateAsyncAction.run(() => super.checkForAuthState());
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStoreBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStoreBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setLogedIn() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setLogedIn');
    try {
      return super.setLogedIn();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToLogin() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.switchToLogin');
    try {
      return super.switchToLogin();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToSuigUp() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.switchToSuigUp');
    try {
      return super.switchToSuigUp();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
loggedInState: ${loggedInState},
loading: ${loading},
authMode: ${authMode},
showErrors: ${showErrors},
email: ${email},
username: ${username},
password: ${password},
isFormValid: ${isFormValid}
    ''';
  }
}
