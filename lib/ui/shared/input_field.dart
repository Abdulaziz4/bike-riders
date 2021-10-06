import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final void Function(String) validator;
  final bool obscureText;
  const InputField(
      {Key? key,
      this.hint = "",
      required this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
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
        obscureText: widget.obscureText,
        onChanged: (_) {},
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: kAltColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kSecondryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
