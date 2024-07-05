import 'package:flutter/material.dart';
import 'package:t_shirt_app/widgets/menu/menu.dart';
import 'package:t_shirt_app/widgets/t_shirt_card.dart';
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
        title: const Text('tişört mağazam'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      drawer: const Menu(),
      body: Column(
        children: [
          const SizedBox(height: 20), // Üst kısımdan boşluk bırakmak için
          const Expanded(
            child: Center(
              child: TshirtCard(), // TshirtCard widget'ı ortada
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const NavigationMenu(), // Alt kısımda sabit kalan navigasyon menüsü
    );
  }
}
