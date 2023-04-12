import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealDetailsScrenn extends StatefulWidget {
  const MealDetailsScrenn({super.key});
  static const routeName = '/mealDetails';

  @override
  State<MealDetailsScrenn> createState() => _MealDetailsScrennState();
}

class _MealDetailsScrennState extends State<MealDetailsScrenn> {
  int activityImage = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          meal.title,
          // "Meal Details",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.people_sharp,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
                initialPage: activityImage,
                onPageChanged: (index, reason) {
                  setState(() {
                    activityImage = index;
                  });
                },
              ),
              items: meal.imageUrls.map(
                (image) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: image.startsWith("assets/")
                        ? Image.asset(image, fit: BoxFit.cover)
                        : Image.network(image, fit: BoxFit.cover),
                  );
                },
              ).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrls.map((image) {
                final cureentImage = meal.imageUrls.indexOf(image);
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: activityImage == cureentImage
                        ? Colors.black
                        : Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 13),
            Text(
              "\$${meal.price}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tarifi : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 450,
                        // height: double.infinity,
                        child: Text(
                          meal.description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                margin: const EdgeInsets.all(16),
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (ctx, index) {
                    return Text(meal.ingredients[index]);
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
