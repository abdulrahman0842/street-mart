import 'package:flutter/material.dart';
import 'package:street_mart/models/product_model.dart';
import 'package:street_mart/services/get_products_services.dart';
import 'package:street_mart/widgets/product_post_card.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key, required this.category});
  final String category;
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  GetProductsServices getProductsServices = GetProductsServices();
  List<Products>? products;
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await getProductsServices.getProductByCategory(widget.category);
    setState(() {
      products = getProductsServices.productsByCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),
      body: products == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                          Products product = products![index];
                          return ProductPostCard(
                            product: product,
                          );
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
