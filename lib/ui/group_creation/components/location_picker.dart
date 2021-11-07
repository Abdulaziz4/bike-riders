import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/location_helper.dart';

class LocationPickerView extends StatefulWidget {
  final LatLng? initialPosition;

  const LocationPickerView({Key? key, this.initialPosition}) : super(key: key);
  @override
  _LocationPickerViewState createState() => _LocationPickerViewState();
}

class _LocationPickerViewState extends State<LocationPickerView> {
  // late Completer<GoogleMapController> _mapController;
  GoogleMapController? _mapController;

  LatLng? _currentPosition;

  String? _mapStyle;
  Future moveToLocation(LatLng currentLocation) async {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: currentLocation, zoom: 16),
    ));
  }

  void requestAndMoveToLoction() async {
    final currentLocation = await LocationHelper.getUserLocation();

    if (currentLocation != null) {
      setState(() {
        _currentPosition = currentLocation;
      });
      moveToLocation(_currentPosition!);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMap();
    if (widget.initialPosition != null) {
      moveToLocation(widget.initialPosition!);
      _currentPosition = widget.initialPosition;
    }
  }

  void _loadMap() {
    rootBundle.loadString('assets/darkmap.json').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              controller.setMapStyle(_mapStyle);
              _mapController = controller;
            },
            onCameraMove: (position) {
              setState(() {
                _currentPosition = position.target;
              });
            },
            initialCameraPosition: CameraPosition(
              target: LocationHelper.riyadhCenter,
              zoom: 11,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          buildPin(),
          buildLocationCard(),
          buildMyCurrentLocationFAB(),
        ],
      ),
    );
  }

  Widget buildLocationCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        margin: const EdgeInsets.all(kDefaultPadding),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: popAndPassLocation,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPin() {
    return IgnorePointer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.place,
              size: 56,
              color: kPurpleColor,
            ),
            Container(
              decoration: const ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
                shape: CircleBorder(
                  side: BorderSide(
                    width: 4,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  Widget buildMyCurrentLocationFAB() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: requestAndMoveToLoction,
          mini: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.my_location),
          heroTag: "myLocation",
        ),
      ),
    );
  }

  void popAndPassLocation() {
    Navigator.of(context).pop(_currentPosition);
    // locator<NavigationService>().back<dynamic>(result: _currentPosition);
  }
}
