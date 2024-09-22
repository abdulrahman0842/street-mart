import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:street_mart/widgets/categories_header.dart';
import 'package:street_mart/widgets/product_post_card.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('StreetMart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoriesHeader(),
              const Divider(
                indent: 5,
                endIndent: 5,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductPostCard(width: widget.width);
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
