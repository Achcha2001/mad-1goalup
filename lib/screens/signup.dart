import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:goalup/models/user.dart';
//import 'package:firebase_core/firebase_core.dart';


Color myLightPurple = Color(0xFFE1BEE7);
class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController membersController = TextEditingController();
  final TextEditingController teamNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: myLightPurple,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: membersController,
              decoration: InputDecoration(labelText: 'Add Members'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: teamNameController,
              decoration: InputDecoration(labelText: 'Team Name (Optional)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Validate required fields
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  // Show an error message or handle accordingly
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all required fields.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                // TODO: Implement your signup logic here
                User newUser = User.fromSignup(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  teamName: teamNameController.text,
                  members: membersController.text.split(','), // Assuming members are comma-separated
                );

                // For now, just navigate to the home page after signup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(loggedInUserName: newUser.name)),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
