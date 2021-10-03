import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:bike_riders/ui/startup/startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (viewmodel) => viewmodel.initlizeApp(),
      builder: (context, viewmodel, _) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
