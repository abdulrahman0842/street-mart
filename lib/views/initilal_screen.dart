import 'package:flutter/material.dart';
import 'package:street_mart/views/home.dart';
import 'package:street_mart/views/new_post.dart';
import 'package:street_mart/views/profile.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
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
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [Home(), NewPost(), Profile()],
      ),
    );
  }
}
