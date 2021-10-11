// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/auth/login/login_view.dart';
import '../../ui/auth/onboarding/onboarding_view.dart';
import '../../ui/auth/signup/signup_view.dart';
import '../../ui/groups/groups_view.dart';
import '../../ui/nav_bar/navigation_bar.dart';
import '../../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String onBoardingView = '/on-boarding-view';
  static const String navigationBarController = '/navigation-bar-controller';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String groupsView = '/groups-view';
  static const all = <String>{
    startupView,
    onBoardingView,
    navigationBarController,
    loginView,
    signupView,
    groupsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.onBoardingView, page: OnBoardingView),
    RouteDef(Routes.navigationBarController, page: NavigationBarController),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.groupsView, page: GroupsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    OnBoardingView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const OnBoardingView(),
        settings: data,
      );
    },
    NavigationBarController: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const NavigationBarController(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SignupView(),
        settings: data,
      );
    },
    GroupsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const GroupsView(),
        settings: data,
      );
    },
  };
}
