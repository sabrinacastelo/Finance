import 'dart:developer';

import 'package:finances/features/signup/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 2));
      log("logado");
      _changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      log("erro");
      _changeState(SignUpErrorState());
      return false;
    }
  }
}