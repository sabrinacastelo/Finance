import 'package:finances/features/signin/sign_in_state.dart';
import 'package:finances/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInState _state = SignInStateInitial();

  SignInController(this._service);

  SignInState get state => _state;

  void _changeState(SignInState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> doSignIn({
    required String email, 
    required String password
    }) async {
    _changeState(SignInStateLoading());

    try {
      await _service.signIn(
        email: email, 
        password: password
      );
      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}