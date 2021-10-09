import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:bike_riders/core/services/auth_service.dart';

class SignupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();

  String? _email;
  String? _password;

  String? errorMessage;

  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      setBusy(true);
      await _authService.signUpWithEmail(
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

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void navigateToLogin() {
    _navService.replaceWith(Routes.loginView);
  }
}
