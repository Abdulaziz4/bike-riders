import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/authentication_header.dart';
import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthenticationHeader(text: "Welcome\nBack"),
          Spacer(),
          InputField(
            hint: "Email",
            validator: (_) {},
          ),
          InputField(
            hint: "Password",
            validator: (_) {},
            obscureText: true,
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          CustomButton(
            text: "Login",
            onPress: () {},
            size: const Size(140, 42),
            textStyle: kLargeText,
          ),
          Spacer(),
          AuthenticationInstruction(
            buttonText: "Create Account",
            hintText: "Don't have an account ?",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
