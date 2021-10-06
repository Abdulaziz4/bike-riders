import 'package:bike_riders/ui/auth/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/services/auth_service.dart';
import 'package:bike_riders/ui/auth/login/login_view.dart';
import 'package:bike_riders/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
  ],
  dependencies: [
    LazySingleton(classType: AuthService),
    LazySingleton(classType: NavigationService),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation
   *  that generates the required functionality **/
}
