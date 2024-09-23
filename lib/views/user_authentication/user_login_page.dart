import 'package:flutter/material.dart';
import 'package:street_mart/models/user_account_model.dart';
import 'package:street_mart/services/user_account.dart';
import 'package:street_mart/views/initilal_screen.dart';
import 'package:street_mart/views/user_authentication/user_registration_page.dart';
import 'package:street_mart/views/user_authentication/widgets/user_credential_input_field.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  moveToHome(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const InitilalScreen()));
    // String email = SharedPreferencesHelper.getValue('emailID') ?? 'Not found';
    // String password =
    //     SharedPreferencesHelper.getValue('password') ?? 'Not found';
    // if (_formKey.currentState!.validate()) {
    //   if (email == _emailContoller.text &&
    //       password == _passwordController.text) {
    //     SharedPreferencesHelper.Login();
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const HomePage(),
    //         ));
    //     _emailContoller.clear();
    //     _passwordController.clear();
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(const SnackBar(content: Text('Login Successful!')));
    //   } else {
    //     return ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Email or Password not matched!')));
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 201, 229, 223),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFFADCFC8),
              Color.fromARGB(255, 63, 133, 117),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login to Street Mart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, letterSpacing: 5),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        UserCredentialInputField(
                          controller: _emailContoller,
                          labelText: "Email",
                          hintText: 'Enter Email',
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return 'Please Enter an Email';
                            }
                            String pattern = '^[^@]+@[^@]+\.[^@]+';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserCredentialInputField(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          isObscur: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be Empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              LoginUserModel userData = LoginUserModel(
                                  email: _emailContoller.text,
                                  password: _passwordController.text);
                              UserAuthenticationService().loginUser(userData);
                              moveToHome(context);
                            },
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserRegistrationPage()));
                            },
                            child: const Text('Register Here...'),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
