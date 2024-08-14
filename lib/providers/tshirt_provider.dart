import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t_shirt_app/models/t_shirt.dart';

class FavoriteTshirtNotifier extends StateNotifier<List<Tshirt>> {
  FavoriteTshirtNotifier() : super([]);

  bool toggleTshirtFavoriteStatus(Tshirt tshirt) {
    final tshirtIsFavorite = state.contains(tshirt);
    if (tshirtIsFavorite) {
      state = state.where((t) => t.id != tshirt.id).toList();
      return false;
    } else {
      state = [...state, tshirt];
      return true;
    }
  }

  List<Tshirt> favoriteProduct() {
    return state;
  }
}

final favoriteTshirtProvider =
    StateNotifierProvider<FavoriteTshirtNotifier, List<Tshirt>>((ref) {
  return FavoriteTshirtNotifier();
});
