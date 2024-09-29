// import 'package:flutter/material.dart';
// import 'package:street_mart/models/user_account_model.dart';
// import 'package:street_mart/services/user_authentications.dart';
// import 'package:street_mart/views/user_authentication/user_login_page.dart';
// import 'package:street_mart/views/user_authentication/widgets/user_credential_input_field.dart';

// class UserRegistrationPage extends StatefulWidget {
//   const UserRegistrationPage({super.key});

//   @override
//   State<UserRegistrationPage> createState() => _UserRegistrationPageState();
// }

// class _UserRegistrationPageState extends State<UserRegistrationPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               'Register to Street Mart',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 35, letterSpacing: 5),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             UserCredentialInputField(
//                 controller: nameController,
//                 labelText: 'Name',
//                 hintText: 'Enter Name'),
//             const SizedBox(
//               height: 15,
//             ),
//             UserCredentialInputField(
//                 controller: emailController,
//                 labelText: 'Email',
//                 hintText: 'Enter Email'),
//             const SizedBox(
//               height: 15,
//             ),
//             UserCredentialInputField(
//               controller: passwordController,
//               labelText: 'Password',
//               hintText: 'Enter Password',
//               isObscur: true,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * 0.07,
//               width: MediaQuery.sizeOf(context).width * 0.9,
//               child: ElevatedButton(
//                 onPressed: () {
//                   RegisterUserModel userData = RegisterUserModel(
//                       name: nameController.text,
//                       email: emailController.text,
//                       password: passwordController.text);
//                   UserAuthenticationService().registerUser(userData);
//                 },
//                 child: const Text(
//                   'Register',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8),
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const UserLoginPage()));
//                   },
//                   child: const Text('Login Here')),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:street_mart/models/user_account_model.dart';
import 'package:street_mart/services/user_authentications.dart';
import 'package:street_mart/views/initilal_screen.dart';
import 'package:street_mart/views/user_authentication/widgets/auth_theme.dart';

class UserRegistrationPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserRegistrationPage({super.key});

  void _registerUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      RegisterUserModel userData = RegisterUserModel(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);
      UserAuthenticationService().registerUser(userData);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const InitialScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AuthTheme.backgroundDecoration(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Register', style: AuthTheme.titleStyle()),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              hintText: 'Enter Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () => _registerUser(context),
                            style: AuthTheme.buttonStyle(),
                            child: const Text('Register'),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Back to Login
                            },
                            child: const Text(
                              'Already have an account? Login Here',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
