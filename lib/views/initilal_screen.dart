import 'package:flutter/material.dart';
import 'package:street_mart/views/home.dart';
import 'package:street_mart/views/new_post.dart';
import 'package:street_mart/views/profile.dart';

class InitilalScreen extends StatefulWidget {
  const InitilalScreen({super.key});

  @override
  State<InitilalScreen> createState() => _InitilalScreenState();
}

class _InitilalScreenState extends State<InitilalScreen> {
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
          Home(
            width: width,
          ),
          const NewPost(),
          const Profile()
        ],
      ),
    );
  }
}
