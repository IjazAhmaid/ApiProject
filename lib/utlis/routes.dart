import 'package:flutter/material.dart';
import 'package:getapi/home_screen.dart';
import 'package:getapi/photoapi.dart';
import 'package:getapi/signup.dart';
import 'package:getapi/user_api.dart';
import 'package:getapi/utlis/routes_name.dart';
import 'package:getapi/withoutmodels.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.userApi:
        return MaterialPageRoute(builder: (context) => const UserApi());

      case RouteName.photoApi:
        return MaterialPageRoute(builder: (context) => const PhotoApi());

      case RouteName.withOutModels:
        return MaterialPageRoute(builder: (context) => const WithOutModels());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No Screen Defined')),
          );
        });
    }
  }
}
