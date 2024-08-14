import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_shirt_app/providers/tshirt_provider.dart';
import 'package:http/http.dart' as http;

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteTshirts = ref.watch(favoriteTshirtProvider);
    return Scaffold(
      body: ListView.builder(
          itemCount: favoriteTshirts.length,
          itemBuilder: (ctx, item) {
            return Dismissible(
              key: Key(favoriteTshirts[item].id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                ref
                    .read(favoriteTshirtProvider.notifier)
                    .toggleTshirtFavoriteStatus(favoriteTshirts[item]);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${favoriteTshirts[item].name} silindi ')));
              },
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(favoriteTshirts[item].name),
                subtitle: Text(favoriteTshirts[item].price.toString()),
                leading: Image.asset(favoriteTshirts[item].imagePath),
              ),
            );
          }),
    );
  }
}
