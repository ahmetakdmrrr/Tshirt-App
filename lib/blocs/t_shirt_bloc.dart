import 'dart:async';
import 'package:t_shirt_app/models/t_shirt.dart';
import 'package:t_shirt_app/repository/t_shirt_service.dart';

class TshirtBloc {
  static final tshirtStreamController = StreamController.broadcast();
  static Stream get getStream{
    return tshirtStreamController.stream;
  } 
  

  static List<Tshirt> getAll() {
    return TshirtService.getAll();
  }
}

final tshirtBloc = TshirtBloc();
