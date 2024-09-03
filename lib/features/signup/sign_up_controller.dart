import 'package:finances/features/signup/sign_up_state.dart';
import 'package:finances/services/auth_service.dart';
import 'package:finances/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignUp(
      {required String name,
      required String email,
      required String password}) async {
    const secureStorage = SecureStorage();
    _changeState(SignUpLoadingState());

    try {
      final user =
          await _service.signUp(name: name, email: email, password: password);
      if (user.id != null) {
        await secureStorage.write(key: 'CURRENT_USER', value: user.toJson());
      } else {
        throw Exception();
      }
      _changeState(SignUpSuccessState());

    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
