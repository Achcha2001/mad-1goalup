import 'package:flutter/material.dart';

class TargetsPage extends StatefulWidget {
  @override
  _TargetsPageState createState() => _TargetsPageState();
}

class _TargetsPageState extends State<TargetsPage> {
  List<Target> targets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Targets'),
        backgroundColor: Color.fromARGB(255, 9, 41, 136), // Set app bar color to dark blue
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildDateSection('Today', DateTime.now()),
          _buildDateSection('Tomorrow', DateTime.now().add(Duration(days: 1))),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _openAddTargetForm(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 70, 3, 92), // Set background color to dark purple
    );
  }

  Widget _buildDateSection(String title, DateTime date) {
    List<Target> targetsForDate =
        targets.where((target) => target.date.isAtSameMomentAs(date)).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // Set text color to white
          ),
          SizedBox(height: 10),
          targetsForDate.isEmpty
              ? Text('No events', style: TextStyle(color: Colors.white)) // Set text color to white
              : Column(
                  children: targetsForDate
                      .map((target) => ListTile(
                            title: Text(target.description, style: TextStyle(color: Colors.white)), // Set text color to white
                          ))
                      .toList(),
                ),
          Divider(color: Colors.white), // Set divider color to white
        ],
      ),
    );
  }

  void _openAddTargetForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Target', style: TextStyle(color: Colors.white)), // Set text color to white
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Select Date:', style: TextStyle(color: Colors.white)), // Set text color to white
                SizedBox(height: 10),
                // Add a date picker widget here to select the date
                ElevatedButton(
                  onPressed: () {
                    // Handle date selection
                  },
                  child: Text('Select Date'),
                ),
                SizedBox(height: 20),
                Text('Select List:', style: TextStyle(color: Colors.white)), // Set text color to white
                SizedBox(height: 10),
                // Add a dropdown or some widget to select the list
                ElevatedButton(
                  onPressed: () {
                    // Handle list selection
                  },
                  child: Text('Select List'),
                ),
                SizedBox(height: 20),
                Text('Description:', style: TextStyle(color: Colors.white)), // Set text color to white
                SizedBox(height: 10),
                // Add a text field for description
                TextField(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle saving the target
                    // Add the target to the list and close the dialog
                    setState(() {
                      targets.add(Target(
                        date: DateTime.now(), // Use the selected date
                        description: 'Sample Target', // Use the entered description
                      ));
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Set Target', style: TextStyle(color: Colors.white)), // Set text color to white
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 70, 3, 92), // Set dialog background color to dark purple
        );
      },
    );
  }
}

class Target {
  final DateTime date;
  final String description;

  Target({
    required this.date,
    required this.description,
  });
}
