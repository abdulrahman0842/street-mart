import 'package:flutter/material.dart';
import 'package:street_mart/services/user_credentials_services.dart';
import 'package:street_mart/views/initilal_screen.dart';
import 'package:street_mart/views/user_authentication/user_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserCredentialsServices.initialize();
  bool? isLoggedIn = await UserCredentialsServices.isLoggedIn();
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF3F8575))),
        home: isLoggedIn ? const InitialScreen() : UserLoginPage());
  }
}
