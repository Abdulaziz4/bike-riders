import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ParticipentsSlider extends StatefulWidget {
  final int value;
  final void Function(int) onChange;
  const ParticipentsSlider({
    Key? key,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  _ParticipentsSliderState createState() => _ParticipentsSliderState();
}

class _ParticipentsSliderState extends State<ParticipentsSlider> {
  double value = 20;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0, left: 3),
            child: Text(
              "Number of participents",
              style:
                  kMediumText.copyWith(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          SfSliderTheme(
            data: SfSliderThemeData(
              activeLabelStyle: TextStyle(
                  color: kPurpleColor,
                  fontSize: 12,
                  fontStyle: FontStyle.italic),
              inactiveLabelStyle: TextStyle(
                color: Colors.grey[300],
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            child: SfSlider(
              min: 1,
              max: 51,
              value: widget.value,
              interval: 5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              activeColor: kPurpleColor,
              inactiveColor: kInputColor,
              tooltipTextFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                return actualValue.toStringAsFixed(0);
              },
              onChanged: (dynamic v) {
                widget.onChange((v as double).toInt());
              },
            ),
          ),
        ],
      ),
    );
  }
}
