import 'dart:convert' as json;

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationHelper {
  static const mapsApiKey = "AIzaSyBufg2I0WYIO1EDcUq3qu4wR0qstGWzh2c";

  static const LatLng riyadhCenter = LatLng(24.686431, 46.723296);

  // Trys to get the user current location, returns null if it's not possible
  static Future<LatLng?> getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (exp) {
      return null;
    }
  }

  // Accepts lat and long and return human readable address
  static Future<String> addressFromLatLong(LatLng location) async {
    try {
      final url =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&language=ar&key=$mapsApiKey";
      final results = await http.get(Uri.parse(url));
      final Map<String, dynamic> extractedData = json.jsonDecode(results.body);

      // check status code
      if (extractedData["status"] == "OK") {
        List addressList = extractedData["results"];
        if (addressList.isNotEmpty) {
          return addressList.first["formatted_address"];
        } else {
          return "عنوان غير محدد";
        }
      } else {
        return "عنوان غير محدد";
      }
    } catch (exp) {
      return "";
    }
  }

  static String generateLocationPreviewImage({required LatLng location}) {
    return "https://maps.googleapis.com/maps/api/staticmap?key=$mapsApiKey&center=${location.latitude},${location.longitude}&zoom=17&markers=color:red%7Clabel:C%7C${location.latitude},${location.longitude}&size=600x300&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0x242f3e&style=element:labels.text.fill%7Ccolor:0x746855&style=element:labels.text.stroke%7Ccolor:0x242f3e&style=feature:administrative.locality%7Celement:labels.text.fill%7Ccolor:0xd59563&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0xd59563&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry%7Ccolor:0x263c3f&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x6b9a76&style=feature:road%7Celement:geometry%7Ccolor:0x38414e&style=feature:road%7Celement:geometry.stroke%7Ccolor:0x212a37&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x9ca5b3&style=feature:road.highway%7Celement:geometry%7Ccolor:0x746855&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x1f2835&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xf3d19c&style=feature:transit%7Celement:geometry%7Ccolor:0x2f3948&style=feature:transit.station%7Celement:labels.text.fill%7Ccolor:0xd59563&style=feature:water%7Celement:geometry%7Ccolor:0x17263c&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x515c6d&style=feature:water%7Celement:labels.text.stroke%7Ccolor:0x17263c&size=480x360&region=SA&language=ar";
  }

  static Future<Map<String, dynamic>> latlangToUserLocation(LatLng location,
      {String? address}) async {
    final userAddress = address ?? await addressFromLatLong(location);
    return {
      "latLng": location,
      "address": userAddress,
      "previewUrl": generateLocationPreviewImage(location: location),
    };
  }
}
