import 'package:flutter/material.dart';

import 'package:bike_riders/ui/group_creation/components/section_container.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/location_helper.dart';
import 'package:bike_riders/ui/group_creation/components/location_picker.dart';

class LocationPickingSection extends StatefulWidget {
  final void Function(LatLng) saveLocation;
  const LocationPickingSection({Key? key, required this.saveLocation})
      : super(key: key);

  @override
  State<LocationPickingSection> createState() => _LocationPickingSectionState();
}

class _LocationPickingSectionState extends State<LocationPickingSection> {
  String? _locationImage;

  void showLocationImage(LatLng position) {
    final url = LocationHelper.generateLocationPreviewImage(location: position);
    setState(() {
      _locationImage = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: kAltColor,
                ),
              ),
              alignment: Alignment.center,
              child: _locationImage != null
                  ? Image.network(_locationImage!)
                  : Icon(
                      Icons.map,
                      size: 50,
                      color: Colors.white,
                    ),
            ),
          ),
          CustomButton(
            onPress: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LocationPickerView(),
                ),
              );
              if (result != null) {
                widget.saveLocation(result);
                showLocationImage(result);
              }
            },
            text: "Pick Location",
          ),
        ],
      ),
    );
  }
}
