import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:bike_riders/core/services/auth_service.dart';

class AuthViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  String? _email;
  String? _password;

  String? errorMessage;

  final formKey = GlobalKey<FormState>();

  Future<void> _authenticate(
    Future<void> Function({
      required String email,
      required String password,
    })
        request,
  ) async {
    try {
      setBusy(true);
      await request(
        email: _email!,
        password: _password!,
      );
      _navService.replaceWith(Routes.groupsView);
    } on AuthException catch (exp) {
      errorMessage = exp.message;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setBusy(false);
    }
  }

  void _validateAndSubmitForm(void Function() onValidForm) {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      onValidForm();
    }
  }

  void validateAndSubmitLoginForm() {
    _validateAndSubmitForm(login);
  }

  void validateAndSubmitSignupForm() {
    _validateAndSubmitForm(signup);
  }

  void signup() {
    _authenticate(_authService.signUpWithEmail);
  }

  void login() {
    _authenticate(_authService.loginWithEmail);
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String pass) {
    _password = pass;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void navigateToLogin() {
    _navService.replaceWith(Routes.loginView);
  }

  void navigateToSignup() {
    _navService.replaceWith(Routes.signupView);
  }
}
