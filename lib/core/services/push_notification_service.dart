import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final _logger = getLogger("PushNotificationService");
  late FirebaseMessaging _messaging;

  void requestPermission() async {
    _logger.i("requestPermission");
    _messaging = FirebaseMessaging.instance;
    await _messaging.requestPermission();
    print(await _messaging.getAPNSToken());
  }
}
