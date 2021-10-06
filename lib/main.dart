import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //unfocus input field upon click outside its boundries
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //unfocus input field upon click outside its boundries

        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          backgroundColor: kPrimaryColor,
          primaryColor: kSecondryColor,
          textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            headline2: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodyText1: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.5),
          ),
        ),
      ),
    );
  }
}
