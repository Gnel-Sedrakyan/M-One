import 'package:injectable/injectable.dart';
import 'package:m_one/application/auth/auth_store.dart';
import 'package:m_one/domain/auth/value_objects.dart';
import 'package:mobx/mobx.dart';
part 'auth_form_store.g.dart';

enum AuthMode { login, signup }

@injectable
class AuthFormStore extends _AuthFormStoreBase with _$AuthFormStore {
  final AuthStore authStore;
  AuthFormStore({
    required this.authStore,
  }) : super(authStore: authStore);
}

abstract class _AuthFormStoreBase with Store {
  final AuthStore authStore;

  _AuthFormStoreBase({
    required this.authStore,
  });

  @observable
  bool loading = false;

  @observable
  AuthMode authMode = AuthMode.login;

  @observable
  Email email = Email("");
  @observable
  Username username = Username("");
  @observable
  Password password = Password("");

  @observable
  bool showErrors = false;

  @action
  void setEmail(String value) => email = Email(value);
  @action
  void setUsername(String value) => username = Username(value);
  @action
  void setPassword(String value) => password = Password(value);

  @action
  void login() {
    loading = true;
    showErrors = true;
    Future.delayed(const Duration(seconds: 2));
    loading = false;
  }

  @action
  void signUp() {
    loading = true;
    showErrors = true;
    Future.delayed(const Duration(seconds: 2));
    loading = false;
  }

  @computed
  bool get isFormValid =>
      username.isValid() &&
      password.isValid() &&
      (email.isValid() ||
          authMode == AuthMode.login); // if mode is login email is not needed
}
