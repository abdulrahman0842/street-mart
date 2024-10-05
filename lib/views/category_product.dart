import 'package:flutter/material.dart';
import 'package:street_mart/widgets/product_post_card.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key, required this.category});
  final String category;
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    // return ProductPostCard(width: width);
                    return Text('');
                  }),
              const Divider(
                indent: 5,
                endIndent: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'You are all caught up!!!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
