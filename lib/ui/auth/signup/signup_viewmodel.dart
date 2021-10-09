import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:bike_riders/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  String? _email;
  String? _password;

  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      setBusy(true);
      await _authService.signUpWithEmail(
        email: _email!,
        password: _password!,
      );
    } on AuthException catch (exp) {
    } catch (e) {
    } finally {
      setBusy(false);
    }
  }

  void validateAndSubmitForm() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      signup();
    }
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String pass) {
    _password = pass;
  }
}
