import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class EmojiPicker extends StatefulWidget {
  final void Function(String) onSave;
  const EmojiPicker({Key? key, required this.onSave}) : super(key: key);

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 75,
      child: TextFormField(
        onSaved: (value) {
          if (value != null) {
            widget.onSave(value);
          }
        },
        style: TextStyle(fontSize: 40),
        textAlign: TextAlign.center,
        initialValue: "🚴🏻‍♂️",
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          fillColor: kInputColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kAltColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kAltColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kAltColor, width: 1.0),
          ),
        ),
      ),
    );
  }
}
