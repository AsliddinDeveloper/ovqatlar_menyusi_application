import 'package:flutter/material.dart';
import 'package:food_menu_application/models/meals.dart';
import '../widgets/meal_item.dart';

class CatetgoryMealsScreen extends StatelessWidget {
  final Function toogleLike;
  final Function isFavorite;
  const CatetgoryMealsScreen(
      {Key? key, required this.toogleLike, required this.isFavorite})
      : super(key: key);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final categoryDate =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryDate['categoryTitle'];
    final meals = categoryDate['categoryMeals'] as List<Meal>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          // "Ramazon Muborak", // "categoryName",
          (title),
        ),
      ),
      body: meals.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(18),
              itemBuilder: (ctx, index) => MealItem(
                  meal: meals[index],
                  toogleLike: toogleLike,
                  isFavorite: isFavorite),
              itemCount: meals.length,
            )
          : const Center(
              child: Text(
                "Afsuslki Xozircha taomlar mavjud emas , tez orada yangi taomlar qo'shiladi",
                style: TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
