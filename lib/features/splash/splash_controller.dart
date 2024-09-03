import 'package:finances/features/splash/splash_state.dart';
import 'package:finances/services/secure_storage.dart';
import 'package:flutter/foundation.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = InitialSplashState();
  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 1));
    final result = await _service.readOne(key: "CURRENT_USER");

    if (result != null) {
      _changeState(SuccessSplashState());
    } else {
      _changeState(ErrorSplashState("User not logged"));
    }
  }
}
