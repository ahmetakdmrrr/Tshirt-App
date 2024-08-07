import 'package:flutter/material.dart';
import 'package:t_shirt_app/screens/about_us_Screen.dart';
import 'package:t_shirt_app/screens/login_screen.dart';
import 'package:t_shirt_app/screens/settings_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = isDarkMode
        ? theme.colorScheme.onBackground
        : theme.colorScheme.onSurface;
    final iconColor =
        isDarkMode ? theme.colorScheme.onBackground : theme.colorScheme.primary;
    final tileColor =
        isDarkMode ? theme.colorScheme.surface : theme.colorScheme.background;

    return Drawer(
      backgroundColor: theme.colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
          ListTile(
            tileColor: tileColor,
            leading: Icon(Icons.settings, color: iconColor),
            title: Text(
              'Ayarlar',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            tileColor: tileColor,
            leading: Icon(Icons.contact_mail_rounded, color: iconColor),
            title: Text(
              'iletis im',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            tileColor: tileColor,
            leading: Icon(Icons.all_inbox_outlined, color: iconColor),
            title: Text(
              'Hakkımızda',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
          ),
          ListTile(
            tileColor: tileColor,
            leading: Icon(Icons.logout_sharp, color: iconColor),
            title: Text(
              'Çıkıs yap',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Çıkış yap ?'),
                  content:
                      const Text('Çıkış yapmak istediğinize emin misiniz ?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      ),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
