import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Group {
  final String id;
  final String title;
  final String description;
  final String level;
  final int participents;
  final double distance;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final LatLng location;

  Group({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.participents,
    required this.distance,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
  });
}
