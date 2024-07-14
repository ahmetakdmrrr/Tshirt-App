import 'package:t_shirt_app/models/users.dart';

class UserService {
  static List<Users> users = [];
  static Users? selectedUser;
  static final UserService _singleton = UserService._internal();
  factory UserService() => _singleton;
  UserService._internal();
  static List<Users> getAll() {
    users.add(
      Users(
        name: 'ahmet',
        surName: 'akdemir',
        date: DateTime.now(),
        cinsiyet: 'Erkek',
        email: 'ahmet1456@hotmail.com',
        password: '123456',
        phone: '5055555555',
        userName: 'ahmet_akdmrrr',
      ),
    );
    users.add(
      Users(
        name: 'Ahmet',
        surName: 'Akdemir',
        date: DateTime.now(),
        cinsiyet: 'Erkek',
        email: 'ahmet187@hotmail.com',
        password: '01Aakdemir',
        phone: '5055555555',
        userName: 'ahmet_akdmrrr',
      ),
    );
    users.add(
      Users(
        name: 'ahmet',
        surName: 'akdemir',
        date: DateTime.now(),
        cinsiyet: 'Erkek',
        email: 'ahmet145@hotmail.com',
        password: '753951',
        phone: '5055555555',
        userName: 'ahmet_akdmrrr',
      ),
    );
    return users;
  }
}
