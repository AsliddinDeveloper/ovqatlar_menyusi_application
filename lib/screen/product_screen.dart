import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './add_new_product_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key, required this.meals, required this.deleteMeal});
  final List<Meal> meals;
  final Function deleteMeal;

  static const yolnomi = '/products';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void _goToAddNewProductScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AddNewProductScreen.productscreen)
        .then((value) {
      if (value != true) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Mahsulotlar ",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: IconButton(
                onPressed: () => _goToAddNewProductScreen(context),
                icon: const Icon(
                  Icons.add,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: ListView.builder(
          itemBuilder: ((context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    // backgroundColor: Colors.amber,
                    backgroundImage:
                        widget.meals[index].imageUrls[0].startsWith("assets/")
                            ? AssetImage(widget.meals[index].imageUrls[0])
                            : NetworkImage(widget.meals[index].imageUrls[0])
                                as ImageProvider,
                  ),
                  title: Text(widget.meals[index].title),
                  subtitle: Text("\$${widget.meals[index].price}"),
                  trailing: IconButton(
                    onPressed: () => widget.deleteMeal(widget.meals[index].id),
                    icon: const Icon(Icons.delete_outline),
                  ),
                ),
              )),
          itemCount: widget.meals.length,
        ));
  }
}
