import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(255, 210, 255, 211),
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Sepet',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
