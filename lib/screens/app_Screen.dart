import 'package:flutter/material.dart';
import 'package:t_shirt_app/screens/cart_screen.dart';
import 'package:t_shirt_app/screens/profile_screen.dart';
import 'package:t_shirt_app/widgets/menu/menu.dart';
import 'package:t_shirt_app/widgets/t_shirt_card.dart';
import 'package:t_shirt_app/widgets/navigation_menu.dart/navigation_menu.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 1; // Başlangıçta Ana Sayfa

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const Text('ahmet'); // 'Ekle' ekranı
      case 1:
        return const TshirtCard(); // 'Ana Sayfa' ekranı
      case 2:
        return const CartScreen(); // 'Sepet' ekranı
      case 3:
        return const Profile(); // 'Profil' ekranı
      default:
        return const Text('a'); // Varsayılan ekran
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tişört Mağazam'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      drawer: const Menu(),
      body: Column(
        children: [
          const SizedBox(height: 20), // Üst kısımdan boşluk bırakmak için
          Expanded(
            child: Center(
              child: _selectedScreen(), // Seçilen ekranı göster
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationMenu(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
