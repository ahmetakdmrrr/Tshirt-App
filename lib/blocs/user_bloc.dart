import 'dart:async';
import 'package:t_shirt_app/models/users.dart';
import 'package:t_shirt_app/repository/user_service.dart';

class UserBloc {
  static final userStreamController = StreamController.broadcast();
  static Stream get getStream{
    return userStreamController.stream;
  } 
  

  static List<Users> getAll() {
    return UserService.getAll();
  }
}

final tshirtBloc = UserBloc();
