import 'package:flutter/material.dart';
import 'package:t_shirt_app/widgets/menu/menu.dart';
import 'package:t_shirt_app/widgets/navigation_menu.dart/navigation_menu.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeeDesign'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      drawer: const Menu(),
      body: const NavigationMenu(),

    );
  }
}
