import 'package:flutter/material.dart';
import 'package:street_mart/views/explore.dart';
import 'package:street_mart/views/new_post.dart';
import 'package:street_mart/views/profile.dart';

import '../widgets/product_post_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        onTap: onTapped,
        elevation: 15,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Feed(
            width: width,
          ),
          const Explore(),
          const NewPost(),
          const Profile()
        ],
      ),
    );
  }

  // StaggeredGrid staggered() {
  //   return StaggeredGrid.count(
  //     crossAxisCount: 3,
  //     mainAxisSpacing: 4,
  //     crossAxisSpacing: 4,
  //     children: [
  //       StaggeredGridTile.count(
  //           crossAxisCellCount: 1,
  //           mainAxisCellCount: 1,
  //           child: Container(color: Colors.blue, child: const Text('1'))),
  //       StaggeredGridTile.count(
  //           crossAxisCellCount: 1,
  //           mainAxisCellCount: 1,
  //           child: Container(color: Colors.green, child: const Text('2'))),
  //       StaggeredGridTile.count(
  //           crossAxisCellCount: 1,
  //           mainAxisCellCount: 2,
  //           child: Container(color: Colors.yellow, child: const Text('3'))),
  //       StaggeredGridTile.count(
  //           crossAxisCellCount: 1,
  //           mainAxisCellCount: 1,
  //           child: Container(color: Colors.purple, child: const Text('4'))),
  //       StaggeredGridTile.count(
  //           crossAxisCellCount: 1,
  //           mainAxisCellCount: 1,
  //           child: Container(color: Colors.grey, child: const Text('5')))
  //     ],
  //   );
  // }
}

class Feed extends StatelessWidget {
  const Feed({
    super.key,
    required this.width,
  });

  final double width;

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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ProductPostCard(width: width);
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))),
    );
  }
}
