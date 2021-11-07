import 'package:flutter/material.dart';

import 'package:bike_riders/core/app/constants.dart';

class InputField extends StatefulWidget {
  final String hint;
  final String label;
  final String? Function(String?) validator;
  final void Function(String) onSave;
  final bool obscureText;
  final TextEditingController? controller;
  final int numOfLines;
  const InputField({
    Key? key,
    required this.validator,
    required this.onSave,
    this.label = "",
    this.obscureText = false,
    this.hint = "",
    this.numOfLines = 1,
    this.controller,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 3),
            child: Text(
              widget.label,
              style:
                  kMediumText.copyWith(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          Container(
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
              maxLines: widget.numOfLines,
              validator: widget.validator,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                filled: true,
                fillColor: kInputColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    color: kAltColor,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kSecondryColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kRedColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
