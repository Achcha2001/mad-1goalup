import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart'; // Import the LoginFormPage
import 'package:goalup/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor:Colors.purple,
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Container(
        color: Color.fromARGB(255, 136, 55, 151), // Set body color to light purple
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo.png', 
                height: 250,
                width: 250,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 3.0,
          shrinkWrap: true,
          children: [
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFormPage()),
                );
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
