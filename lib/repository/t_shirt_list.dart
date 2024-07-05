import 'package:t_shirt_app/models/t_shirt.dart';

final List<Tshirt> registeredTshirt = [
  Tshirt(
    name: 'Cool T-shirt',
    imagePath: 'assets/images/t_shirt_1.jpeg',
    description: 'A cool t-shirt for cool people.',
    price: 19.99,
    size: 'M',
    color: ['black', 'white', 'green'],
  ),
  Tshirt(
    name: 'Stylish T-shirt',
    imagePath: 'assets/images/t_shirt_2.jpg',
    description: 'A stylish t-shirt for fashion lovers.',
    price: 24.99,
    size: 'L',
    color: ['White', 'black', 'yellow'],
  ),
  Tshirt(
    name: 'Casual T-shirt',
    imagePath: 'assets/images/t_shirt_3.jpeg',
    description: 'A casual t-shirt for everyday wear.',
    price: 15.99,
    size: 'S',
    color: ['black', 'Blue', 'yellow'],
  ),
];
