import 'package:bike_riders/ui/shared/busy_overlay.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/authentication_header.dart';
import 'package:bike_riders/ui/shared/authentication_instructions.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/shared/input_field.dart';
import 'package:bike_riders/core/app/utils/validator.dart';
import 'package:bike_riders/ui/auth/signup/signup_viewmodel.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, viewmodel, _) => BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Scaffold(
          body: Form(
            key: viewmodel.formKey,
            child: Column(
              children: [
                AuthenticationHeader(text: "Create\nAccount"),
                Spacer(),
                InputField(
                  hint: "Email",
                  validator: Validator.emailValidator,
                  onSave: viewmodel.setEmail,
                ),
                InputField(
                  hint: "Password",
                  obscureText: true,
                  validator: Validator.passwordValidator,
                  controller: _controller,
                  onSave: viewmodel.setPassword,
                ),
                InputField(
                  hint: "Confirm Password",
                  validator: (cPass) {
                    return Validator.confirmPasswordValidator(
                      _controller.text,
                      cPass,
                    );
                  },
                  obscureText: true,
                  onSave: (_) {},
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                CustomButton(
                  text: "Create Account",
                  onPress: viewmodel.validateAndSubmitForm,
                  size: const Size(200, 50),
                  textStyle: TextStyle(fontSize: 19.5),
                ),
                Spacer(),
                AuthenticationInstructions(
                  buttonText: "Create Account",
                  hintText: "Don't have an account ?",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
