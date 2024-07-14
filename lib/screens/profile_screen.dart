import 'package:flutter/material.dart';
import 'package:t_shirt_app/repository/user_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

final user = UserService.selectedUser!;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Üst kısım (ilk renk)
          Container(
              height: 70, // AppBar yüksekliği kadar
              color: Color.fromARGB(255, 255, 255, 255)),
          // İkinci renk (alt kısım)
          Container(
            margin:
                const EdgeInsets.only(top: 70), // Üstteki bölümden aşağı kaydır
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Card(
                  elevation: 4, // Gölge efekti
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Köşe yuvarlama
                  ),
                  child: ListTile(
                    title: const Text(
                      "Ad Soyad",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.name + " " + user.surName),
                    tileColor: const Color.fromARGB(255, 87, 61, 52),
                    leading: const Icon(Icons.person_2, color: Colors.white),
                    textColor: Colors.white, // Yazı rengi
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    title: const Text(
                      "Kullanıcı Adı",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.userName),
                    tileColor: const Color.fromARGB(255, 87, 61, 52),
                    leading: const Icon(Icons.verified_user_rounded,
                        color: Colors.white),
                    textColor: Colors.white,
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: const Text(
                      "Telefon Numarası",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.phone),
                    tileColor: const Color.fromARGB(255, 87, 61, 52),
                    leading: const Icon(Icons.phone, color: Colors.white),
                    textColor: Colors.white,
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: const Text(
                      "E-mail",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.email),
                    tileColor: const Color.fromARGB(255, 87, 61, 52),
                    leading: const Icon(Icons.mail, color: Colors.white),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ), // Alt kısım
          ),
          // Kullanıcı ikonu
          Positioned(
            top: 25, // İkonu yukarı kaydırmak için ayarlayın
            left: MediaQuery.of(context).size.width / 2 - 50, // Ortalamak için
            child: Container(
              width: 100, // Dairenin çapı
              height: 100, // Dairenin çapı
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Daire şeklinde
                // Dairenin rengi
                border: Border.all(
                    color: Colors.black, width: 3), // Kenar rengi ve kalınlığı
              ),
              child: const Center(
                child: Icon(
                  Icons.person, // Kullanıcı ikonu
                  size: 60, // İkon boyutu
                  color: Colors.black, // İkon rengi
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
