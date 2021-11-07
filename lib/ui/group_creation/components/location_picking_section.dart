import 'package:flutter/material.dart';

import 'package:bike_riders/ui/group_creation/components/section_container.dart';
import 'package:bike_riders/ui/shared/custom_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/location_helper.dart';
import 'package:bike_riders/ui/group_creation/components/location_picker.dart';

class LocationPickingSection extends StatefulWidget {
  final void Function(LatLng) saveLocation;
  final bool showLocationNotPickedError;
  const LocationPickingSection(
      {Key? key,
      required this.saveLocation,
      required this.showLocationNotPickedError})
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
      height: 230,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // width: 0,
              margin: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 4,
                horizontal: kDefaultPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 0.5,
                  color: kAltColor,
                ),
              ),
              alignment: Alignment.center,
              child: _locationImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        _locationImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.map,
                      size: 50,
                      color: Colors.white,
                    ),
            ),
          ),
          if (widget.showLocationNotPickedError)
            Text(
              "Please select a location.",
              style: kSmallText.copyWith(
                color: Colors.red,
              ),
            ),
          CustomButton(
            backgroundColor: kPurpleColor,
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
