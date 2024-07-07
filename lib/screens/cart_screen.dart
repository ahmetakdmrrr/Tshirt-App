import 'package:flutter/material.dart';
import 'package:t_shirt_app/blocs/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CartScreenState();
  }
}

final state = cartBloc.getCart();

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: cartBloc.getStream,
              initialData: cartBloc.getCart(),
              builder: (context, snapshot) {
                return buildCart(snapshot);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: payButton(),
          ),
        ],
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    final cart = snapshot.data ?? [];

    if (cart.isEmpty) {
      return const Center(
        child: Text('Sepetiniz boş'),
      );
    }

    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: ListTile(
            leading: Image.asset(
              cart[index].tshirt.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cart[index].tshirt.name),
            subtitle: Text('${cart[index].tshirt.price} TL'),
            trailing: IconButton(
              icon: const Icon(Icons.highlight_remove),
              onPressed: () {
                cartBloc.removeFromCart(cart[index]);
                setState(() {}); // Ekranı güncelle
              },
            ),
          ),
        );
      },
    );
  }

  Widget payButton() {
    if (state.isEmpty) {
      return const Text('');
    } else {
      return ElevatedButton(
        onPressed: () {
          String cont = "";
          final cart = cartBloc.getCart();
          if (cart.isEmpty) {
            cont = "Sepetiniz boş";
          } else {
            cont = "Sepetinizdeki ${cart.length} ürün başarıyla satın alındı";
          }
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('Ödeme bilgisi'),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                      child: Text(
                        cont,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Tamam'),
                    ),
                  ],
                );
              }));
          setState(() {
            // Sepeti boşalt
            cartBloc.cartStreamController.sink.add([]);
          });
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
              double.infinity, 50), // Butonun tam genişlikte olmasını sağlar
          backgroundColor:
              const Color.fromARGB(255, 165, 63, 63), // Buton rengi
        ),
        child: const Text(
          'Ödemeyi Tamamla',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      );
    }
  }
}
