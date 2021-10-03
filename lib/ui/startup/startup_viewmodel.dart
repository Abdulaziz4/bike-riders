import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  void initlizeApp() async {
    //Do initlizations here
    await Firebase.initializeApp();
  }
}
