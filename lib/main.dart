import 'package:bankly_task/login.dart';
import 'package:bankly_task/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Router.initialRoute,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(fontFamily: 'Roboto'),
      title: 'Bankly Task',
      home: LoginScreen(),
    );
  }
}

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
