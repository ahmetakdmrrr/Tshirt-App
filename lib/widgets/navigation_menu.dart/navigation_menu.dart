import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationMenu({
    required this.selectedIndex,
    required this.onDestinationSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(255, 210, 255, 211),
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Ekle',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Sepet',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle),
          label: 'Profil',
        ),
      ],
    );
  }
}
