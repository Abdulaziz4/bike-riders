import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:bike_riders/core/app/app.locator.dart';
import 'package:bike_riders/core/app/app.router.dart';
import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/ui/groups/groups_view.dart';
import 'package:bike_riders/ui/nav_bar/auth_state_viewmodel.dart';
import 'package:bike_riders/ui/profile/profile_view.dart';

class NavigationBarController extends StatefulWidget {
  const NavigationBarController({Key? key}) : super(key: key);

  @override
  State<NavigationBarController> createState() =>
      _NavigationBarControllerState();
}

class _NavigationBarControllerState extends State<NavigationBarController> {
  final List<Widget> _pagesList = [
    ProfileView(),
    GroupsView(),
  ];

  int _selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthStateViewModel>.reactive(
        viewModelBuilder: () => AuthStateViewModel(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            body: IndexedStack(
              index: _selectedPage,
              children: _pagesList,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: kAltColor,
              iconSize: 30,
              elevation: 11,
              items: <BottomNavigationBarItem>[
                buildBottomNavigationBarItem(Icons.person),
                buildBottomNavigationBarItem(Icons.home),
              ],
              currentIndex: _selectedPage,
              onTap: (index) {
                setState(() {
                  _selectedPage = index;
                });
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: navigateToCreategroup,
                ),
              ),
            ),
          );
        });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
      ),
      label: "",
    );
  }

  void navigateToCreategroup() {
    final _navService = locator<NavigationService>();
    _navService.navigateTo(Routes.groupCreationView);
  }
}
