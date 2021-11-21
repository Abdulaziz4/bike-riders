import 'package:bike_riders/core/app/utils/validator.dart';
import 'package:bike_riders/ui/auth/auth_viewmodel.dart';
import 'package:bike_riders/ui/shared/auth_error_message.dart';
import 'package:bike_riders/ui/shared/busy_overlay.dart';
import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/authentication_header.dart';
import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              body: Form(
                key: viewmodel.formKey,
                child: Column(
                  children: [
                    AuthenticationHeader(text: "Welcome\nBack"),
                    Spacer(),
                    InputField(
                      hint: "Email",
                      validator: Validator.emailValidator,
                      onSave: viewmodel.setEmail,
                      horizantolMargin: kDefaultPadding * 1.5,
                    ),
                    InputField(
                      hint: "Password",
                      obscureText: true,
                      validator: Validator.passwordValidator,
                      onSave: viewmodel.setPassword,
                      horizantolMargin: kDefaultPadding * 1.5,
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    AuthErrorMessage(message: viewmodel.errorMessage),
                    CustomButton(
                      text: "Login",
                      onPress: viewmodel.validateAndSubmitLoginForm,
                      size: const Size(140, 42),
                      textStyle: kLargeText,
                    ),
                    Spacer(),
                    AuthenticationInstructions(
                      buttonText: "Create Account",
                      hintText: "Don't have an account ?",
                      onPressed: viewmodel.navigateToSignup,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
