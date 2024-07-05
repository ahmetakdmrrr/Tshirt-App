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
  }):id = uuid.v4();

  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String size;
  final List<String> color;
}
