import 'package:finances/features/signin/sign_in_state.dart';
import 'package:finances/services/auth_service.dart';
import 'package:finances/services/secure_storage.dart';
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

      const secureStorage = SecureStorage();
    _changeState(SignInStateLoading());

    try {
      final user = await _service.signIn(
        email: email, 
        password: password
      );

      if (user.id != null) {
        secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignInStateSuccess());
      } else {
        throw Exception();
      }
      
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}