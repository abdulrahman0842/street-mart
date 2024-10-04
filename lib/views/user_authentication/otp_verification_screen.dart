import 'package:flutter/material.dart';
import 'package:street_mart/models/otp_model.dart';
import 'package:street_mart/services/user_authentications.dart';
import 'package:street_mart/views/initilal_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, required this.email});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool isLoading = false;

  void _verifyOTP(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      OTPModel otpData = OTPModel(widget.email, _otpController.text);
      bool isVerified =
          await UserAuthenticationService().otpVerification(otpData);
      setState(() {
        isLoading = false;
      });
      if (isVerified) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const InitialScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:  Text('Invalid OTP, please try again!')));
      }

      // Navigator required
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // OTP Input Field
              TextFormField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the OTP';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  _verifyOTP(context);
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
