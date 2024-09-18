import 'package:flutter/material.dart';
import 'package:street_mart/widgets/categories_header.dart';

import '../widgets/product_grid_view.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            CategoriesHeader(),
            Divider(),
            ProductGridView()
          ],
        ),
      ),
    );
  }
}
