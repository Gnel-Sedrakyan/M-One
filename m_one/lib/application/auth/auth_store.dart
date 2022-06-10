import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

@lazySingleton
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  bool isLoggedIn = false;

  @action
  void setLogedIn() {
    isLoggedIn = true;
  }

  @action
  void loggout() {
    isLoggedIn = false;
  }
}
