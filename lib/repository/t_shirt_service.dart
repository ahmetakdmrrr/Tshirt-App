import 'package:t_shirt_app/models/t_shirt.dart';

class TshirtService {
  static List<Tshirt> tshirts = [];
  static final TshirtService _singleton = TshirtService._internal();
  factory TshirtService() => _singleton;
  TshirtService._internal();

  // Bu metod, örnek verileri sağlayarak tshirts listesini doldurur.
  static List<Tshirt> getAll() {
    // Listeye t-shirt örnekleri ekliyoruz.
    tshirts.add(
      Tshirt(
        name: 'Cool T-shirt',
        imagePath: 'assets/images/t_shirt_1.jpeg',
        description: 'A cool t-shirt for cool people.',
        price: 19.99,
        size: 'M',
        color: ['black', 'white', 'green'],
      ),
    );
    tshirts.add(
      Tshirt(
        name: 'Stylish T-shirt',
        imagePath: 'assets/images/t_shirt_2.jpg',
        description: 'A stylish t-shirt for fashion lovers.',
        price: 24.99,
        size: 'L',
        color: ['white', 'black', 'yellow'],
      ),
    );
    tshirts.add(
      Tshirt(
        name: 'Casual T-shirt',
        imagePath: 'assets/images/t_shirt_3.jpeg',
        description: 'A casual t-shirt for everyday wear.',
        price: 15.99,
        size: 'S',
        color: ['black', 'blue', 'yellow'],
      ),
    );
    tshirts.add(
      Tshirt(
        name: 'Casual T-shirt',
        imagePath: 'assets/images/t_shirt_4.jpg',
        description: 'A casual t-shirt for everyday wear.',
        price: 15.99,
        size: 'S',
        color: ['black', 'blue', 'yellow'],
      ),
    );
    
    return tshirts;
  }
}
