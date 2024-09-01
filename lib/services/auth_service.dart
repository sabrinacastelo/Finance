import 'package:finances/common/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    String? name, 
    required String email, 
    required String password
    });
  Future signIn();
}
