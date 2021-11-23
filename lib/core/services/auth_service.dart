import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:bike_riders/core/services/push_notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class AuthService with ReactiveServiceMixin {
  final _firebaseAuth = FirebaseAuth.instance;

  final _logger = getLogger("AuthService");

  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);

  void initlizeAuth() {
    _user.value = _firebaseAuth.currentUser;
  }

  User? get user => _user.value;
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
      _logger.e(
          "loginWithEmail | Failed with error code: ${exp.code} , Message: ${exp.message}");
      throw AuthException(exp.code);
    } catch (e) {
      _logger.e('loginWithEmail Failed with error code: $e , Message: $e');
      rethrow;
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
      _logger.e(
          'signUpWithEmail | Failed with error code: ${exp.code} , Message: ${exp.message}');
      throw AuthException(exp.code);
    } catch (exp) {
      _logger
          .e('signUpWithEmail | Failed with error Message: ${exp.toString()}');
      rethrow;
    }
  }

  void logout() {
    _firebaseAuth.signOut();
    _user.value = null;
  }

  bool isLogedIn() => user != null;

  AuthService() {
    listenToReactiveValues([_user]);
  }
}
