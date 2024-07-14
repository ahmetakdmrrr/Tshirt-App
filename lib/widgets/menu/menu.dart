import 'package:flutter/material.dart';
import 'package:t_shirt_app/screens/about_us_Screen.dart';
import 'package:t_shirt_app/screens/login_screen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.settings, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Ayarlar',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {}),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.contact_mail_rounded, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'İletişim',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {}),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.all_inbox_outlined, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Hakkımızda',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              }),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.logout_sharp, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Çıkış yap',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Çıkış yap ?'),
                          content: const Text(
                              'Çıkış yapmak istediğinize emin misiniz ?'),
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
                        ));
              }),
        ],
      ),
    );
  }
}
