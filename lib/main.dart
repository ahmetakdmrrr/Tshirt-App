import 'package:flutter/material.dart';
import 'package:t_shirt_app/screens/app_Screen.dart';
import 'package:t_shirt_app/screens/login_screen.dart';
import 'package:t_shirt_app/screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(BuildContext context) =>const AppScreen(),
        "/login":(BuildContext context) =>const LoginPage(),
        "/sepet":(BuildContext context) =>const CartScreen(),
      },
      initialRoute: "/login",
    );
  }
}
