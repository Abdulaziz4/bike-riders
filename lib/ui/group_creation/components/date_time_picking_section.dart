import 'package:bike_riders/ui/group_creation/components/section_container.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';

import 'package:bike_riders/core/app/utils/colors_helper.dart';
import 'package:bike_riders/ui/group_creation/components/date_picker_field.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';

class RideDateTimePickingSection extends StatefulWidget {
  const RideDateTimePickingSection({
    Key? key,
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
          DatePickerField(),
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
                        "4:00 PM",
                        style: kMediumText,
                      ),
                      buildPickTimeButton(),
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
                        "4:00 PM",
                        style: kMediumText,
                      ),
                      buildPickTimeButton(),
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

  CustomButton buildPickTimeButton() {
    return CustomButton(
      backgroundColor: kPurpleColor,
      onPress: () {
        Navigator.of(context).push(
          showPicker(
            context: context,
            accentColor: kPurpleColor,
            value: TimeOfDay.now(),
            onChange: (_) {},
          ),
        );
      },
      text: "Pick Time",
      textStyle: kSmallText,
    );
  }
}
