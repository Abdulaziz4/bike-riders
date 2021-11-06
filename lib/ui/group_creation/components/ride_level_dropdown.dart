import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class RideLevelDropdown extends StatefulWidget {
  final void Function(String) onSave;
  const RideLevelDropdown({Key? key, required this.onSave}) : super(key: key);

  @override
  _RideLevelDropdownState createState() => _RideLevelDropdownState();
}

class _RideLevelDropdownState extends State<RideLevelDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(enabledBorder: InputBorder.none),
        hint: Text(
          "Level",
          style: TextStyle(color: Colors.grey[600]),
        ),
        // value: "Beginner",
        dropdownColor: kAltColor,
        onSaved: (value) {
          if (value != null) {
            widget.onSave(value.toString());
          }
        },
        validator: (value) {
          if (value == null) {
            return "Please select the level.";
          }
          return null;
        },
        onChanged: (_) {},
        items: const [
          DropdownMenuItem(
            child: Text("Beginner"),
            value: "Beginner",
          ),
          DropdownMenuItem(
            child: Text("Intermediate"),
            value: "Intermediate",
          ),
          DropdownMenuItem(
            child: Text("Hardcore"),
            value: "Hardcore",
          ),
        ],
      ),
    );
  }
}
