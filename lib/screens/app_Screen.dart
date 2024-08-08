import 'package:flutter/material.dart';
import 'package:t_shirt_app/screens/about_us_Screen.dart';
import 'package:t_shirt_app/screens/cart_screen.dart';
import 'package:t_shirt_app/screens/profile_screen.dart';
import 'package:t_shirt_app/widgets/menu/menu.dart';
import 'package:t_shirt_app/widgets/navigation_menu.dart/navigation_menu.dart';
import 'package:t_shirt_app/screens/t_shirt_card.dart';

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
        return const Text('Ekle'); // 'Ekle' ekranı
      case 1:
        return const TshirtCard(); // 'Ana Sayfa' ekranı
      case 2:
        return const CartScreen(); // 'Sepet' ekranı
      case 3:
        return const Profile(); // 'Profil' ekranı
      case 4:
        return const AboutUs(); // 'Hakkımızda' ekranı
      default:
        return const Text('Varsayılan Ekran'); // Varsayılan ekran
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('T-shirt app'),
        centerTitle: true,
        backgroundColor: theme
            .colorScheme.primaryContainer, // Temanın arka plan rengini kullan
      ),
      drawer: const Menu(),
      body: Center(
        child: _selectedScreen(), // Seçilen ekranı göster
      ),
      bottomNavigationBar: NavigationMenu(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
