import 'package:finances/common/models/user_model.dart';
import 'package:finances/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        return UserModel(
          id: _auth.currentUser?.uid,
          email: _auth.currentUser?.email,
          name: _auth.currentUser?.displayName,
        );
      } else {
        throw Exception('');
      }

    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'nulo';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await result.user!.updateDisplayName(name);

        return UserModel(
          id: result.user!.uid,
          email: result.user!.email,
          name: result.user!.displayName,
        );
      } else {
        throw Exception('');
      }

    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'nulo';
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
