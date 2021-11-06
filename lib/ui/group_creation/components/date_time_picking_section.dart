import 'package:bike_riders/ui/group_creation/components/section_container.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';

import 'package:bike_riders/ui/group_creation/components/date_picker_field.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';

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
      height: 250,
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
                        style: kMediumText,
                      ),
                      Text(
                        widget.startTime?.toString() ??
                            TimeOfDay.now().toString(),
                        style: kMediumText,
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
                        style: kMediumText,
                      ),
                      Text(
                        widget.endTime?.toString() ??
                            TimeOfDay.now().toString(),
                        style: kMediumText,
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
      onPress: () async {
        await Navigator.of(context).push(
          showPicker(
            context: context,
            accentColor: kPurpleColor,
            value: TimeOfDay.now(),
            onChange: (result) {
              onPicked(result);
            },
          ),
        );
      },
      text: "Pick Time",
      textStyle: kSmallText,
    );
  }
}
