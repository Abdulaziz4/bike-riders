import 'package:bike_riders/core/app/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/material.dart';

class DistanceSlider extends StatefulWidget {
  final double value;
  final void Function(double) onChange;
  const DistanceSlider({
    Key? key,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  _DistanceSliderState createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
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
              "Distance in KM",
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
              max: 101,
              value: widget.value,
              interval: 10,
              showTicks: true,
              showLabels: true,
              showDividers: true,
              minorTicksPerInterval: 2,
              enableTooltip: true,
              activeColor: kPurpleColor,
              inactiveColor: kInputColor,
              tooltipTextFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                return actualValue.toStringAsFixed(0);
              },
              onChanged: (dynamic value) {
                widget.onChange(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
