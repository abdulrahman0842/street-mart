import 'package:flutter/material.dart';
import 'package:street_mart/widgets/category_type_icon.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryTypeIcon(
              icon: Icons.school,
              category: 'Stationary',
            ),
            CategoryTypeIcon(icon: Icons.shopping_cart, category: "Fashion"),
            CategoryTypeIcon(
                icon: Icons.laptop_chromebook, category: "Electronicss"),
            CategoryTypeIcon(icon: Icons.plumbing_rounded, category: "Hardware")
          ],
        )
      ],
    );
  }
}
