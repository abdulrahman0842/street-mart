import 'package:flutter/material.dart';
import 'package:street_mart/models/user_account_model.dart';
import 'package:street_mart/services/user_account.dart';
import 'package:street_mart/views/user_authentication/login.dart';
import 'package:street_mart/views/user_authentication/widgets/user_credential_input_field.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Register to Street Mart',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, letterSpacing: 5),
            ),
            const SizedBox(
              height: 15,
            ),
            UserCredentialInputField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter Name'),
            const SizedBox(
              height: 15,
            ),
            UserCredentialInputField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Email'),
            const SizedBox(
              height: 15,
            ),
            UserCredentialInputField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter Password',
              isObscur: true,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  RegisterUserModel userData = RegisterUserModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text);
                  UserAuthenticationService().registerUser(userData);
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forget Password')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserAuthenticationPage()));
                      },
                      child: const Text('Login Here'))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
