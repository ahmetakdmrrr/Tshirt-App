import 'package:flutter/material.dart';
import 'package:t_shirt_app/blocs/t_shirt_bloc.dart';
import 'package:t_shirt_app/blocs/cart_bloc.dart';
import 'package:t_shirt_app/models/cart.dart';

class TshirtCard extends StatelessWidget {
  const TshirtCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildProductList();
  }

  buildProductList() {
    return StreamBuilder(
      initialData: TshirtBloc.getAll(),
      stream: TshirtBloc.getStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return const Center(
            child: Text('Veri yok'),
          );
        }
        return buildProductListItems(snapshot);
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        String buttonText = "Sepete Ekle";
        var list = snapshot.data;
        return Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(list[index].name),
                    content: Text(list[index].description),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Okay'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  list[index].imagePath,
                  fit: BoxFit.cover,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${list[index].name}\n${list[index].price}",
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      cartBloc
                          .addToCart(Cart(tshirt: list[index], quantity: 1));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 35),
                      backgroundColor: const Color.fromARGB(255, 196, 219, 197),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
