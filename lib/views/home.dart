import 'package:flutter/material.dart';
import 'package:street_mart/models/product_model.dart';
import 'package:street_mart/services/get_products_services.dart';
import 'package:street_mart/widgets/categories_header.dart';
import 'package:street_mart/widgets/product_post_card.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final getProductServices = GetProductsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Street Mart',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoriesHeader(),
              const Divider(
                indent: 5,
                endIndent: 5,
              ),
              FutureBuilder(
                  future: getProductServices.getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Exception: ${snapshot.error}');
                    }
                    if (snapshot.data == null) {
                      return const Text('No product available');
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          Products product = snapshot.data![index];
                          return ProductPostCard(product: product);
                        });
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
