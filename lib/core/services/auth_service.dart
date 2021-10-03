import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  final _logger = getLogger("AuthService");

  // Future<bool> _authenticateUser(Future<UserCredential>  validateUser) async {}

  /* 
  Log the user in using [email] and [password]
  returns true if user successfuly loged in otherwise in error will be thrown
  */
  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    _logger.i("loginWithEmail | args: email=> $email , password=> $password");
    try {
      final authRes = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final success = authRes.user != null;

      _logger.i("loginWithEmail successfuly logged in");
      return success;
    } on FirebaseAuthException catch (exp) {
      _logger
          .e("Failed with error code: ${exp.code} , Message: ${exp.message}");
      throw AuthException(exp.code);
    } catch (e) {
      _logger.e('Failed with error code: $e , Message: $e');
      throw e;
    }
  }

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final authRes = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final success = authRes.user != null;

      return success;
    } on FirebaseAuthException catch (exp) {
      print('Failed with error code: ${exp.code} , Message: ${exp.message}');
      throw AuthException(exp.code);
    } catch (exp) {
      print('Failed with error code: $exp , Message: $exp');
      throw exp;
    }
  }
}
