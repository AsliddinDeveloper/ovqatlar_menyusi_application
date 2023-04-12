import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final TextEditingController imageController;
  final String label;
  // final String borderImageText;
  const CustomImageInput({
    super.key,
    // required TextEditingController preparingTimeController,
    required this.imageController,
    required this.label,
    // required this.borderImageText,
  });

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  var image;
  //  : _imageUrls = imageUrls, _preparingTimeController = preparingTimeController;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,
            ),
            border: Border.all(
              color: Colors.green,
            ),
          ),
          child: image != null && image!.isNotEmpty
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                )
              : Text(
                  // borderImageText,
                  "Rasm Kiriting!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: widget.label,

              // "Assosiy Rasm manzilini yuboring!",
            ),
            controller: widget.imageController,
            onSubmitted: (value) {
              setState(() {
                image = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
