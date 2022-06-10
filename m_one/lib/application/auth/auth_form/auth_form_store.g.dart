// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthFormStore on _AuthFormStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AuthFormStoreBase.isFormValid'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_AuthFormStoreBase.loading', context: context);

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
      Atom(name: '_AuthFormStoreBase.authMode', context: context);

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

  late final _$emailAtom =
      Atom(name: '_AuthFormStoreBase.email', context: context);

  @override
  Email get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(Email value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_AuthFormStoreBase.username', context: context);

  @override
  Username get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(Username value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthFormStoreBase.password', context: context);

  @override
  Password get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(Password value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_AuthFormStoreBase.showErrors', context: context);

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

  late final _$_AuthFormStoreBaseActionController =
      ActionController(name: '_AuthFormStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthFormStoreBaseActionController.startAction(
        name: '_AuthFormStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_AuthFormStoreBaseActionController.startAction(
        name: '_AuthFormStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_AuthFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthFormStoreBaseActionController.startAction(
        name: '_AuthFormStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$_AuthFormStoreBaseActionController.startAction(
        name: '_AuthFormStoreBase.login');
    try {
      return super.login();
    } finally {
      _$_AuthFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signUp() {
    final _$actionInfo = _$_AuthFormStoreBaseActionController.startAction(
        name: '_AuthFormStoreBase.signUp');
    try {
      return super.signUp();
    } finally {
      _$_AuthFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
authMode: ${authMode},
email: ${email},
username: ${username},
password: ${password},
showErrors: ${showErrors},
isFormValid: ${isFormValid}
    ''';
  }
}
