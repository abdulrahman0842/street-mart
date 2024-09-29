import 'package:flutter/material.dart';

class ProductPostCard extends StatelessWidget {
  const ProductPostCard({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'abdulrahman0842',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '25/09/2024',
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
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Laptop',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Noi siamo furon transitorie con segreto forza e. E e sono manifesta.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
