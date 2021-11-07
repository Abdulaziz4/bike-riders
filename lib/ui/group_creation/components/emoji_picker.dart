import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmojiPicker extends StatefulWidget {
  final void Function(String) onSave;
  const EmojiPicker({Key? key, required this.onSave}) : super(key: key);

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  static final RegExp regexEmoji = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Select emoji";
          }
          return null;
        },
        style: TextStyle(fontSize: 40),
        textAlign: TextAlign.center,
        initialValue: "🚴🏻‍♂️",
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regexEmoji),
          TextInputFormatter.withFunction((oldValue, newValue) {
            return oldValue.text.isNotEmpty && newValue.text.isNotEmpty
                ? oldValue
                : newValue;
          }),
        ],
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
