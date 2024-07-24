import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:t_shirt_app/blocs/t_shirt_bloc.dart';
import 'package:t_shirt_app/blocs/cart_bloc.dart';
import 'package:t_shirt_app/data.api/t_shirt_api.dart';
import 'package:t_shirt_app/models/cart.dart';
import 'package:t_shirt_app/models/t_shirt.dart';

class TshirtCard extends StatefulWidget {
  const TshirtCard({super.key});

  @override
  TshirtCardState createState() => TshirtCardState();
}

class TshirtCardState extends State<TshirtCard> {
  List<Tshirt> products = []; // `product` yerine `products` olarak değiştirdik

  @override
  void initState() {
    super.initState();
    getCategoriesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return buildProductList();
  }

  Widget buildProductList() {
    return StreamBuilder(
      initialData: TshirtBloc.getAll(),
      stream: TshirtBloc.getStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return const Center(
            child: Text('Veri yok'),
          );
        }
        products = snapshot.data; // `products` listesini güncelliyoruz
        return buildProductListItems();
      },
    );
  }

  Widget buildProductListItems() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        String buttonText = "Sepete Ekle";
        var list = products; // `products` listesini kullanıyoruz
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
                        child: const Text('Tamam'),
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
                        borderRadius: BorderRadius.circular(20),
                      ),
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

  void getCategoriesFromApi() {
    TshirtsApi.getproduct().then((response) {
      if (response.statusCode == 200) {
        setState(() {
          List<dynamic> jsonList = jsonDecode(response.body);
          products = jsonList.map((json) => Tshirt.fromjson(json)).toList(); // Model sınıfından nesneler oluşturulmuş
        });
      } else {
        // Hata yönetimi
        print('API çağrısı başarısız oldu: ${response.statusCode}');
      }
    }).catchError((error) {
      // Hata yönetimi
      print('API çağrısında hata oluştu: $error');
    });
  }
}
