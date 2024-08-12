import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_shirt_app/blocs/t_shirt_bloc.dart';
import 'package:t_shirt_app/blocs/cart_bloc.dart';
import 'package:t_shirt_app/data.api/t_shirt_api.dart';
import 'package:t_shirt_app/models/cart.dart';
import 'package:t_shirt_app/models/t_shirt.dart';
import 'package:t_shirt_app/providers/tshirt_provider.dart';
import 'package:t_shirt_app/screens/t_shirt_detail.dart';

class TshirtCard extends ConsumerStatefulWidget {
  const TshirtCard({super.key});

  @override
  TshirtCardState createState() => TshirtCardState();
}

class TshirtCardState extends ConsumerState<TshirtCard> {
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
        products = snapshot.data;
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
        var list = products;
        final isFavorite = ref
            .watch(favoriteTshirtProvider)
            .contains(list[index]); // Favori olup olmadığını kontrol ediyoruz

        return Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => TShirtDetailScreen(
                    tshirt: list[index],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: list[index].id,
                  child: Image.asset(
                    list[index].imagePath,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cartBloc.addToCart(
                              Cart(tshirt: list[index], quantity: 1));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 35),
                          backgroundColor:
                              const Color.fromARGB(255, 196, 219, 197),
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
                      IconButton(
                        onPressed: () {
                          final wasAdded = ref
                              .read(favoriteTshirtProvider.notifier)
                              .toggleTshirtFavoriteStatus(list[index]);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(wasAdded
                                    ? 'T-shirt added to favorite'
                                    : 'T-shirt removed from favorite')),
                          );
                        },
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 25,
                      ),
                    ],
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
          products = jsonList.map((json) => Tshirt.fromjson(json)).toList(); //
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
