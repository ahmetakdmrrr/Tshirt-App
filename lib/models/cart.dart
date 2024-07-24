import 'package:t_shirt_app/models/t_shirt.dart';

class Cart {
  Cart({required this.tshirt, required this.quantity});
  late Tshirt tshirt;
  late int quantity;

  Cart.fromJson(Map json) {
    tshirt = Tshirt.fromjson(json['tshirt']);
    quantity = json['quantity'];
  }
  Map toJson() {
    return {"tshirt ": tshirt , "sayısı" : quantity};
  }
}
