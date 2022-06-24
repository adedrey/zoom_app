import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/views/screens/home_screen.dart';
import 'package:zoom_app/views/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  // Import AuthController Class to gain access to its functions and variables
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join meeting",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Image
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Image.asset("assets/images/onboarding.jpg"),
          ),

          CustomButton(
            text: "Login",
            onPressed: () {
              _authController.signInWithGoogle();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
