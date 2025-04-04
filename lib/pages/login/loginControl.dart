import 'package:app/pages/login/loginState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginControl extends StateNotifier<LoginState> {
  LoginControl():super(LoginState()){
    //
  }

  Future <void> submitForm() async{
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 3));
    state = state.copyWith(isLoading: false);
  }

}

final loginControlPorvider = StateNotifierProvider<LoginControl, LoginState> ((ref){
  ref.keepAlive();
  return LoginControl();
});