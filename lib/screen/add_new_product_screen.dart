import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/custom_image_input.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen(
      {super.key, required this.categories, required this.addFunction});
  final List<Category> categories;
  static const productscreen = '/add-new-product';
  final Function addFunction;

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categoryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    categoryId = widget.categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final desc = _descriptionController.text;
    final ingred = _ingredientsController.text;
    final price = _priceController.text;
    final prepTime = _preparingTimeController.text;
    final mainImage = _mainImageController.text;
    final firstImage = _firstImageController.text;
    final secondImage = _secondImageController.text;
    final thirdImage = _thirdImageController.text;
    if (title.isEmpty ||
        desc.isEmpty ||
        ingred.isEmpty ||
        price.isEmpty ||
        prepTime.isEmpty ||
        mainImage.isEmpty ||
        firstImage.isEmpty ||
        secondImage.isEmpty ||
        thirdImage.isEmpty) {
      return;
    }

    final List<String> ingreds = ingred.split(',');
    final List<String> imageUrls = [
      mainImage,
      firstImage,
      secondImage,
      thirdImage
    ];

    widget.addFunction(
      Meal(
          id: UniqueKey().toString(),
          title: title,
          description: desc,
          imageUrls: imageUrls,
          categoryId: categoryId,
          price: double.parse(price),
          preparingTime: int.parse(prepTime),
          ingredients: ingreds),
    );
    Navigator.of(context).pop(true);
    //  https://media.istockphoto.com/id/1352856480/photo/italian-dishes-for-family-dinner.jpg?b=1&s=170667a&w=0&k=20&c=UnxAcWw3_GxR-JkhKxpPm0Q8vGQuYSmi_X9ni9YYgO4=
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Yangi ovqatlar Qo'shish"),
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DropdownButton(
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },

                value: categoryId,
                isExpanded: true,
                // onTap: {} {},
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        child: Text(category.title),
                        value: category.id,
                      ),
                    )
                    .toList(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom Tarifi",
                ),
                maxLines: 3,
                controller: _descriptionController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText:
                      "Taom tarkibi : (Misol uchun: Pomidor, Go'sh, .... )",
                ),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Narxi",
                ),
                keyboardType: TextInputType.number,
                controller: _priceController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Tayoorlanish vaqti",
                ),
                keyboardType: TextInputType.number,
                controller: _preparingTimeController,
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageController: _mainImageController,
                // borderImageText:  borderImageText,
                label: "Assosiy Rasm manzilini yuboring!",
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageController: _firstImageController,
                label: "Keyingi rasm manzilini yuboring!",
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageController: _secondImageController,
                label: "Keyingi rasm manzilini yuboring!",
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageController: _thirdImageController,
                label: "keyingi rasm manzilini yuboring!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
