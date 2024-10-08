import 'package:finances/features/signin/sign_in_controller.dart';
import 'package:finances/features/signup/sign_up_controller.dart';
import 'package:finances/features/splash/splash_controller.dart';
import 'package:finances/services/auth_service.dart';
import 'package:finances/services/firebase_auth_service.dart';
import 'package:finances/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {

  locator.registerLazySingleton<AuthService>( () => FireBaseAuthService());

  locator.registerFactory<SplashController>(() => SplashController(const SecureStorage()));

  locator.registerFactory<SignInController>(
    () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
    () => SignUpController(locator.get<AuthService>()));
}