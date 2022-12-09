import 'package:flutter/material.dart';

import 'package:getapi/utlis/routes.dart';
import 'package:getapi/utlis/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.homeScreen,
      onGenerateRoute: Routes.genrateRoute,
    );
  }
}
