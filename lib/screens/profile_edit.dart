import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  File? _image;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // Function to open the camera
  Future<void> _openCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Section: Name and Photo
            GestureDetector(
              onTap: () {
                _showImagePickerOptions();
              },
              child: ClipOval(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: 100, // Set the desired width
                          height: 100, // Set the desired height
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'User Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // User Information Form
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),

            // Save Button
            ElevatedButton(
              onPressed: () {
                _saveProfile();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show image picker options
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Open Camera'),
              onTap: () {
                Navigator.pop(context);
                _openCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Select from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to save the profile
  void _saveProfile() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Implement your logic to save/update the profile
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileEditPage(),
  ));
}
