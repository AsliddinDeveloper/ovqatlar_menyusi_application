import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screen/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toogleLike;
  final Function isFavorite;
  const MealItem(
      {super.key,
      required this.meal,
      required this.toogleLike,
      required this.isFavorite});

  void _goToMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScrenn.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: double.infinity,
                      child: meal.imageUrls[0].startsWith("assets/")
                          ? Image.asset(meal.imageUrls[0], fit: BoxFit.cover)
                          : Image.network(
                              meal.imageUrls[0],
                              fit: BoxFit.cover,
                            )),
                  // "https://media.istockphoto.com/id/1313807711/photo/shot-of-a-group-of-businesspeople-having-a-meeting-in-the-boardroom-of-a-modern-office.jpg?s=612x612&w=0&k=20&c=oFC03PzALLtgCUePWFySe6oHCrfKHcIn9HycBF7SuOc=",

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: Colors.black.withOpacity(0.3),
                      child: Text(
                        meal.title,
                        // "Burger",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => toogleLike(meal.id),
                    icon: Icon(
                      isFavorite(meal.id)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Color.fromARGB(255, 241, 34, 19),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "${meal.preparingTime} Minutes",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.black12,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "\$${meal.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.black12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
