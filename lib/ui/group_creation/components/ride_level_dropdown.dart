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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 3),
            child: Text(
              "Level",
              style:
                  kMediumText.copyWith(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: kInputColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: kAltColor,
                width: 0.5,
              ),
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(enabledBorder: InputBorder.none),
              hint: Text(
                "Select ride level",
                style: TextStyle(color: Colors.grey[400]),
              ),
              // value: "Beginner",
              dropdownColor: kInputColor,
              onSaved: (value) {
                if (value != null) {
                  widget.onSave(value.toString());
                }
              },
              iconEnabledColor: Colors.grey[300],
              validator: (value) {
                if (value == null) {
                  return "Please select the level.";
                }
                return null;
              },
              onChanged: (_) {},
              items: [
                DropdownMenuItem(
                  child: Text(
                    "Beginner",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  value: "Beginner",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Intermediate",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  value: "Intermediate",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Hardcore",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  value: "Hardcore",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
