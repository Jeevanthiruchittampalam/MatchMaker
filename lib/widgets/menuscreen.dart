import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Make sure this path matches your project structure
import 'profile.dart';  // Ensure you have created and correctly referred to profile.dart

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/BAIGibbonsMenuScreen.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Position the row of three buttons at the bottom
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircleButton(context, "Match", const Color.fromARGB(255, 6, 3, 120), diameter: 80),
                  _buildCircleButton(context, "Messages", const Color.fromARGB(255, 6, 3, 120), diameter: 80),
                  _buildCircleButton(context, "Profile", const Color.fromARGB(255, 6, 3, 120), diameter: 80, action: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                  }),
                ],
              ),
            ),
            // Position the Friends button
            Positioned(
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: 120,
              child: _buildCircleButton(context, "Friends", const Color.fromARGB(255, 6, 3, 120), diameter: 60),
            ),
            // Add a Back button at the top
            Positioned(
              top: 20,
              right: 20,
              child: _buildCircleButton(context, "Back", const Color.fromARGB(255, 255, 0, 0), diameter: 60, action: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, String text, Color color, {double diameter = 80, void Function()? action}) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,  // Increased font size for larger buttons
            ),
          ),
        ),
      ),
    );
  }
}
