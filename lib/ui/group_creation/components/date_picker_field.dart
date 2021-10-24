import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: kDefaultPadding),
      child: DateTimeField(
        format: DateFormat.yMMMd(),
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            return date;
          }
          return currentValue;
        },
        style: kMediumText,
        decoration: InputDecoration(
          hintText: "Ride Date",
          // filled: true,
          // fillColor: Colors,
          hintStyle: kMediumText,
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
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
