import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

class Users {
  Users(
      {required this.name,
      required this.surName,
      required this.userName,
      required this.cinsiyet,
      required this.date,
      required this.email,
      required this.password,
      required this.phone})
      : id = uuid.v4();

  late String id;
  late String name;
  late String surName;
  late String userName;
  late DateTime date;
  late String cinsiyet;
  late String email;
  late String password;
  late String phone;

  String get formattedDate {
    return formatter.format(date);
  }

  Users.fromjson(Map json) {
    id = json["id"];
    name = json["name"];
    surName = json["surName"];
    userName = json["userName"];
    date = json["date"].toDate();
    cinsiyet = json["cinsiyet"];
    email = json["email"];
    password = json["password"];
    phone = json["phone"];

  }
  Map json() {
    return {
      "id": id,
      "name": name,
      "surName": surName,
      "useName" : userName,
      "date" : date,
      "cinsiyet":cinsiyet,
      "email": email,
      "password": password,
      "phone": phone
    };
  }
}
