import 'package:flutter/material.dart';

class CategoryTypeIcon extends StatelessWidget {
  const CategoryTypeIcon({
    super.key,
    required this.icon,
    required this.category,
  });
  final IconData icon;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: Icon(
          icon,
          size: 45,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        category,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      )
    ]);
  }
}
