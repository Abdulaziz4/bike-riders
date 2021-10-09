import 'package:bike_riders/core/app/utils/auth_exception.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  String? _email;
  String? _password;

  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      setBusy(true);
    } on AuthException catch (exp) {
    } catch (e) {
    } finally {
      // setBusy(false);
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
