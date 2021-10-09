import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final String? Function(String?) validator;
  final void Function(String) onSave;
  final bool obscureText;
  final TextEditingController? controller;
  const InputField({
    Key? key,
    this.hint = "",
    required this.validator,
    this.obscureText = false,
    this.controller,
    required this.onSave,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 1.5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(1.6, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        onSaved: (value) {
          if (value != null) {
            widget.onSave(value);
          }
        },
        validator: widget.validator,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: kSecondryColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kAltColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kRedColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
