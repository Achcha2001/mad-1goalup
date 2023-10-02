import 'package:flutter/material.dart';
import 'package:goalup/screens/home_page.dart';

class EnvironmentPage extends StatefulWidget {
  @override
  _EnvironmentPageState createState() => _EnvironmentPageState();
}

class _EnvironmentPageState extends State<EnvironmentPage> {
  TextEditingController _environmentNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Environment'),
        backgroundColor: Color.fromARGB(255, 9, 41, 136), // Set app bar color to dark blue
      ),
      body: Container(
        color: Color.fromARGB(255, 70, 3, 92), // Set background color to dark purple
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _environmentNameController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Environment Name',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _chooseList,
              child: Text('Choose List', style: TextStyle(color: Colors.white)), // Set button text color to white
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Target Date: ',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                _selectedDate != null
                    ? Text(
                        _selectedDate!.toLocal().toString(),
                        style: TextStyle(color: Colors.white), // Set text color to white
                      )
                    : Text(
                        'Not set',
                        style: TextStyle(color: Colors.white), // Set text color to white
                      ),
                IconButton(
                  onPressed: _selectDate,
                  icon: Icon(Icons.calendar_today, color: Colors.white), // Set icon color to white
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              maxLines: 3,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveEnvironment,
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: Text(
                'Save Environment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _chooseList() {
    // Implement logic to choose a list
    // This could be a modal bottom sheet, a dialog, or navigation to a different screen
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveEnvironment() {
    // Implement logic to save the environment with the collected data
    String environmentName = _environmentNameController.text;
    String description = _descriptionController.text;

    print('Environment Name: $environmentName');
    print('Selected List: $_selectedList');
    print('Target Date: $_selectedDate');
    print('Description: $description');
  }
}

void main() {
  runApp(MaterialApp(
    home: EnvironmentPage(),
  ));
}
