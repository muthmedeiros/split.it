import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/login/login_service.dart';

import 'login_state.dart';

class LoginController {
  LoginState loginState = LoginStateEmpty();
  VoidCallback onUpdate;
  Function(LoginState loginState)? onChange;

  final LoginService loginService;

  LoginController({
    required this.onUpdate,
    required this.loginService,
  });

  Future<void> googleSignIn() async {
    try {
      loginState = LoginStateLoading();
      update();
      final user = await loginService.googleSignIn();
      loginState = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      loginState = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(loginState);
    }
  }

  void listen(Function(LoginState loginState) onChange) {
    this.onChange = onChange;
  }
}
