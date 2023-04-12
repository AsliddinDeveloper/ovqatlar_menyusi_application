import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screen/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.meals});

  final List<Meal> meals;

  void _goToCategoryMealsScreen(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: ((ctx) => CatetgoryMealsScreen(
    //         categoryName: category.title,
    //       )),
    // ));
    Navigator.of(context).pushNamed(CatetgoryMealsScreen.routeName,
        arguments: {'categoryTitle': category.title, 'categoryMeals': meals});
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                category.imageUrl,
                // "https://media.istockphoto.com/id/1281410543/photo/pouring-cola-from-bottle-into-glass-and-fizz-with-ice-cubes-on-table-against-blurred.jpg?s=612x612&w=0&k=20&c=chJr_K50Z4M776qv5x0jZmZ5nTuCjuckBWcBlrMGazI=",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                // "Ichimliklar",
                style: const TextStyle(
                  // fontStyle: GoogleFonts,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
