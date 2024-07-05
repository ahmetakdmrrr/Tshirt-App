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

  final String id;
  final String name;
  final String surName;
  final String userName;
  final DateTime date;
  final String cinsiyet;
  final String email;
  final String password;
  final String phone;

  String get formattedDate {
    return formatter.format(date);
  }
}
