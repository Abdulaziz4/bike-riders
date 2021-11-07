import 'package:flutter/material.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';

import 'package:bike_riders/ui/group_creation/components/date_picker_field.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:bike_riders/ui/group_creation/components/section_container.dart';

class RideDateTimePickingSection extends StatefulWidget {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;

  final void Function(TimeOfDay) saveStartTime;
  final void Function(TimeOfDay) saveEndTime;
  final void Function(DateTime) saveDate;

  const RideDateTimePickingSection({
    Key? key,
    required this.saveDate,
    required this.endTime,
    required this.saveEndTime,
    required this.saveStartTime,
    required this.startTime,
  }) : super(key: key);

  @override
  State<RideDateTimePickingSection> createState() =>
      _RideDateTimePickingSectionState();
}

class _RideDateTimePickingSectionState
    extends State<RideDateTimePickingSection> {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          DatePickerField(saveDate: widget.saveDate),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Start Time",
                        style: kMediumText.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.startTime?.format(context) ??
                            TimeOfDay.now().toString(),
                        style: kMediumText.copyWith(fontSize: 17),
                      ),
                      buildPickTimeButton(widget.saveStartTime),
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 0.2,
                  color: kAltColor,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "End Time",
                        style: kMediumText.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.endTime?.format(context) ??
                            TimeOfDay.now().toString(),
                        style: kMediumText.copyWith(fontSize: 17),
                      ),
                      buildPickTimeButton(widget.saveEndTime),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomButton buildPickTimeButton(void Function(TimeOfDay) onPicked) {
    return CustomButton(
      backgroundColor: kPurpleColor,
      textStyle: kMediumText.copyWith(fontSize: 16),
      onPress: () async {
        await Navigator.of(context).push(
          showPicker(
            context: context,
            accentColor: kPurpleColor,
            okCancelStyle:
                TextStyle(color: kSecondryColor, fontWeight: FontWeight.bold),
            value: TimeOfDay.now(),
            onChange: (result) {
              onPicked(result);
            },
          ),
        );
      },
      text: "Pick Time",
    );
  }
}
