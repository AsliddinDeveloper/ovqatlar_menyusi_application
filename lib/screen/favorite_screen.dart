import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function toogleLike;
  final Function isFavorite;
  const FavoriteScreen(
      {super.key,
      required this.favorites,
      required this.toogleLike,
      required this.isFavorite});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _toggleLike(String mealid) {
    setState(() {
      widget.toogleLike(mealid);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Sevimli taomlaringiz uchirildi !"),
        action: SnackBarAction(
          label: 'Bekor qilish',
          onPressed: () {
            setState(() {
              widget.toogleLike(mealid);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0
        ? ListView.builder(
            itemCount: widget.favorites.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: widget.favorites[index],
              toogleLike: _toggleLike,
              isFavorite: widget.isFavorite,
            ),
          )
        : const Center(
            child: Text(
              "Sevimlida xozircha taomlar mavjud emas",
            ),
          );
  }
}
