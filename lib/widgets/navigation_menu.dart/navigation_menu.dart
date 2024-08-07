import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationMenu({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return NavigationBar(
      backgroundColor: theme.colorScheme.background,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.add, color: theme.colorScheme.primary),
          label: 'Ekle',
        ),
        NavigationDestination(
          icon: Icon(Icons.home, color: theme.colorScheme.onBackground),
          label: 'Ana Sayfa',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart, color: theme.iconTheme.color),
          label: 'Sepet',
        ),
        NavigationDestination(
          icon:
              Icon(Icons.account_circle, color: theme.colorScheme.onBackground),
          label: 'Profil',
        ),
      ],
    );
  }
}
