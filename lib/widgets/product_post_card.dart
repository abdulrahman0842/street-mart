import 'package:flutter/material.dart';
import 'package:street_mart/models/product_model.dart';

class ProductPostCard extends StatelessWidget {
  const ProductPostCard({
    super.key,
    required this.product,
  });

  final Products? product;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(
                Icons.person_2_sharp,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product!.userId!.name ?? 'Unknown',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  product!.createdAt ?? 'xx/xx/xxxx',
                  style: TextStyle(color: Colors.grey.shade600),
                )
              ],
            )
          ]),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: width * 0.80,
            width: width * 0.95,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product!.productImgURL ?? 'ImageURL')),
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product!.productName ?? 'Unknown',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product!.productLocation ?? 'Unknown',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
