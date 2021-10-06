import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              hint: "Email",
              validator: (_) {},
            ),
            InputField(
              hint: "Password",
              validator: (_) {},
              obscureText: true,
            ),
            CustomButton(
              text: "Login",
              onPress: () {},
              size: const Size(125, 40),
            ),
            AuthenticationInstruction(
              buttonText: "Create Account",
              hintText: "Don't have an account ?",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
