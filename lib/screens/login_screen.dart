import 'package:flutter/material.dart';
import 'package:t_shirt_app/repository/user_list.dart';
import 'package:t_shirt_app/screens/app_Screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void loginControl() {
    final enteredusername = _userNameController.text;
    final enteredpassword = _passwordController.text;

    if (enteredusername.isEmpty || enteredpassword.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Hata'),
          content: const Text('Lütfen boş kısımları doldurunuz'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    for (var user in registeredUsers) {
      if (user.userName == enteredusername &&
          user.password == enteredpassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AppScreen()),
        );
        return;
      }
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hata'),
        content: const Text(
            'Kullanıcı adı veya şifreniz hatalı lütfen tekrar deneyiniz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userNameController,
              keyboardType: TextInputType.text,
              maxLength: 50,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_2_outlined),
                hintText: 'Kullanıcı adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: _obscureText,
              maxLength: 50,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                hintText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: loginControl,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 116, 28, 132),
              ),
              child: const Text(
                'Giriş yap',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
