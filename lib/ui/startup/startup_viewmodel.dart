import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void initlizeApp() async {
    //Do initlizations here
    await Firebase.initializeApp();
    _navigationService.replaceWith(Routes.onBoardingView);
  }
}
