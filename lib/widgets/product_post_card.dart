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
          const Row(children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'abdulrahman0842',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text('Noor Pharma, Mushawerat Chowk')
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
            child: Stack(children: [
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            StadiumBorder(side: BorderSide(width: 1)))),
                    onPressed: () {},
                    child: const Icon(Icons.location_on_outlined),
                  )),
            ]),
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
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined),
              Flexible(
                child: Text(
                  'Noi siamo furon transitorie con segreto forza e. E e sono manifesta.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
