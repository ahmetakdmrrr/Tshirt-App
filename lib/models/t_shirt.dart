import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Tshirt {
  Tshirt({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.color,
    required this.size,
  }) : id = uuid.v4();

  late String id;
  late String name;
  late String description;
  late String imagePath;
  late double price;
  late String size;
  late List<String> color;

  Tshirt.fromjson(Map json) {
    id = json["id"];
    name = json['name'];
    price = json['price'];
    imagePath = json['imagePath'];
    description = json['description'];
    size = json['size'];
    color = json['color'];
  }
  Map json() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "imagePath": imagePath,
      "description": description,
      "size": size,
      "color": color,
    };
  }
}
