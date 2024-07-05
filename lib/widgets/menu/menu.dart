import 'package:flutter/material.dart';
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
                  Icon(Icons.home, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {}),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.list_alt, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Ürünler',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {}),
          ListTile(
              title: const Row(
                children: [
                  Icon(Icons.account_box, color: Colors.black),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Hesabım',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
              onTap: () {}),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }),
        ],
      ),
    );
  }
}
