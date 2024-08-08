import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_shirt_app/blocs/theme_bloc.dart';
import 'package:t_shirt_app/screens/app_screen.dart';
import 'package:t_shirt_app/screens/login_screen.dart';
import 'package:t_shirt_app/screens/cart_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.themeData,
            routes: {
              "/": (BuildContext context) => const AppScreen(),
              "/login": (BuildContext context) => const LoginPage(),
              "/sepet": (BuildContext context) => const CartScreen(),
            },
            initialRoute: "/login",
          );
        },
      ),
    );
  }
}
