import 'package:flutter/material.dart';
import 'package:street_mart/widgets/product_grid_view.dart';

import '../widgets/time_line_list.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showTimeline = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Abdul Rahman',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Text('abdulrahman0842',
                style: TextStyle(
                  fontSize: 16,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        showTimeline = false;
                      });
                    },
                    icon: const Icon(
                      Icons.grid_on,
                      size: 30,
                    )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showTimeline = true;
                      });
                    },
                    icon: const Icon(
                      Icons.timeline_outlined,
                      size: 30,
                    ))
              ],
            ),
            showTimeline ? const TimeLineList() : const ProductGridView()
          ],
        ),
      ),
    );
  }
}
