import 'package:finances/common/models/user_model.dart';
import 'package:finances/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
