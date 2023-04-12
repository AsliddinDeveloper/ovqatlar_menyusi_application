import 'package:flutter/material.dart';
// import 'category_meals_screen.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Category> categories;

  final List<Meal> meals;
  const HomeScreen({Key? key, required this.categories, required this.meals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.menu,
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: const Text(
      //     "Ovqatlar Menyusi",
      //   ),
      //   actions: [
      //     IconButton(
      //       padding: const EdgeInsets.only(right: 20),
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.search,
      //       ),
      //     ),
      //   ],
      // ),
      body: categories.length > 0
          ? GridView(
              // scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: categories.map((category) {
                final categoryMeals = meals
                    .where((meal) => meal.categoryId == category.id)
                    .toList();
                return CategoryItem(category: category, meals: categoryMeals);
              }).toList(),
            )
          : const Center(
              child: Text("Xozircha Mavju emas"),
            ),
    );
  }
}
