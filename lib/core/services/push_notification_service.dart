import 'package:bike_riders/core/app/utils/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final _logger = getLogger("PushNotificationService");
  late FirebaseMessaging _messaging;

  Future<void> requestAndSubscribeNotification() async {
    _logger.i("requestPermission");
    _messaging = FirebaseMessaging.instance;
    final per = await _messaging.requestPermission();

    await _messaging.subscribeToTopic("groups");
    print(per.authorizationStatus);
    print(await _messaging.getToken());
  }
}
