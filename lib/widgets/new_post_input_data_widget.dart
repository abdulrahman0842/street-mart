import 'package:flutter/material.dart';
import 'package:street_mart/widgets/new_post_text_field.dart';

class NewPostInputDataWidget extends StatelessWidget {
  NewPostInputDataWidget({
    super.key,
    required this.width,
  });

  final double width;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Product Name',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        NewPostTextField(
          controller: productNameController,
          hintText: 'Product Name',
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Category',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        DropdownMenu(
            controller: categoryController,
            hintText: 'Category',
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: 'Food',
                label: 'Food',
              ),
              DropdownMenuEntry(value: 'Fashion', label: 'Fasion'),
              DropdownMenuEntry(value: 'Electronics', label: 'Electronics'),
              DropdownMenuEntry(value: 'Groceries', label: 'Groceries')
            ]),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Address',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        NewPostTextField(
          controller: addressController,
          hintText: 'Address',
        ),
      ],
    );
  }
}
