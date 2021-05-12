import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_app/Screens/mainScreen.dart';

import 'Screens/loginScreen.dart';
import 'Screens/singUpScreen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      home: LoginScreen(),
      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


