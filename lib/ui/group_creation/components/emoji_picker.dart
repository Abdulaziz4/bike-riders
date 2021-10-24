import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class EmojiPicker extends StatefulWidget {
  const EmojiPicker({Key? key}) : super(key: key);

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: TextFormField(
        style: TextStyle(fontSize: 40),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "🤩",
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kSecondryColor, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kSecondryColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kSecondryColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
