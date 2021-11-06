import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final Logger _logger = getLogger("FirestoreService");

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
}
