import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './models/category.dart';
import './screen/category_meals_screen.dart';
import './screen/home_screen.dart';
import './models/meals.dart';
import './screen/meal_details_screen.dart';
import './screen/tab_screens.dart';
import '../screen/product_screen.dart';
import './screen/add_new_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final categoModel = Categories();
  final _mealModel = Meals();

  // final categoryModels = Categories();
  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavorite(String mealId) {
    return _mealModel.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }

  void _deleteMeal(String id) {
    setState(() {
      _mealModel.deletedMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          // fontFamily: GoogleFonts.aboreto().fontFamily,
          primarySwatch: Colors.green,
        ),
        // home: HomeScreen(
        //   categories: categoModel.list,
        //   meals: _mealModel.list,
        // ),
        initialRoute: TabScreen.routeName,
        routes: {
          TabScreen.routeName: (ctx) => TabScreen(
                categories: categoModel.list,
                mealModel: _mealModel,
                toogleLike: _toggleLike,
                isFavorite: _isFavorite,
                // meals: _mealModel.list,
              ),
          CatetgoryMealsScreen.routeName: (context) => CatetgoryMealsScreen(
              toogleLike: _toggleLike, isFavorite: _isFavorite),
          MealDetailsScrenn.routeName: (context) => const MealDetailsScrenn(),
          ProductScreen.yolnomi: (ctx) =>
              ProductScreen(meals: _mealModel.list, deleteMeal: _deleteMeal),
          AddNewProductScreen.productscreen: (context) => AddNewProductScreen(
              categories: categoModel.list, addFunction: _addNewMeal),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: ((context) => HomeScreen(
                  categories: categoModel.list,
                  meals: _mealModel.list,
                )),
          );
        });
  }
}
