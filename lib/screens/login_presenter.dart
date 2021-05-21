import 'instgram.dart' as insta;

abstract class LoginViewContract {
  void onLoginScuccess(insta.Token token);
  void onLoginError(String message);
}

class LoginPresenter {
  LoginViewContract _view;
  LoginPresenter(this._view);

  void performLogin() {
    assert(_view != null);
    insta
        .getToken("911142896337312", "5a98291948ca6f3f35bf1c40de7eeb21")
        .then((token) {
      if (token != null) {
        _view.onLoginScuccess(token);
      } else {
        print('Failed to login');
        _view.onLoginError('Error');
      }
    });
  }
}
