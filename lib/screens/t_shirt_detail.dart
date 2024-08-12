import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_shirt_app/models/t_shirt.dart';
import 'package:t_shirt_app/providers/tshirt_provider.dart';

class TShirtDetailScreen extends ConsumerStatefulWidget {
  const TShirtDetailScreen({super.key, required this.tshirt});
  final Tshirt tshirt;

  @override
  _TShirtDetailScreenState createState() => _TShirtDetailScreenState();
}

class _TShirtDetailScreenState extends ConsumerState<TShirtDetailScreen> {
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    // Başlangıçta seçili renk yok
    _selectedColor = null;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteTshirtProvider);
    final isFavorite = favoriteMeals.contains(widget.tshirt);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tshirt.name),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteTshirtProvider.notifier)
                  .toggleTshirtFavoriteStatus(widget.tshirt);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasAdded
                    ? 'ürün favorilere eklendi'
                    : 'ürün favorilerden kaldırıldı'),
              ));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.tshirt.id,
              child: Image.asset(
                widget.tshirt.imagePath,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'ürün açıklaması',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.tshirt.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 35),
            Text(
              'renkler',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (final color in widget.tshirt.color)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedColor == color
                              ? Colors.blue
                              : Colors.grey,
                          width: _selectedColor == color ? 2 : 1,
                        ),
                      ),
                      child: Text(
                        color,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
