// add_popup.dart

import 'package:flutter/material.dart';

class AddPopup extends StatefulWidget {
  @override
  _AddPopupState createState() => _AddPopupState();
}

class _AddPopupState extends State<AddPopup> {
  // Add your logic and UI elements here for the add popup
  // For example, text fields, buttons, etc.

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Task Name field
            TextFormField(
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 20),
            // Add People button
            ElevatedButton(
              onPressed: () {
                // Handle adding people
              },
              child: Text('Add People'),
            ),
            SizedBox(height: 20),
            // Description field
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            // Create button
            ElevatedButton(
              onPressed: () {
                // Handle creating the task
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
