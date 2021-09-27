import 'package:bike_riders/core/services/auth_service.dart';
import 'package:bike_riders/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: AuthService),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
