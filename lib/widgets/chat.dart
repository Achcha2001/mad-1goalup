// widgets/chat.dart

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String loggedInUserName;

  ChatPage({required this.loggedInUserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.indigo, // Set app bar color to dark blue
        actions: [
          // Add a Hamburger menu icon
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          // Add current logged-in person's name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(loggedInUserName),
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple, // Set page body background to dark purple
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Chats Available',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showCreateTeamPopup(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo, // Set button color to dark blue
                onPrimary: Colors.white, // Set text color to white
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set padding
              ),
              child: Text(
                'Create Team',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateTeamPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Team'),
          backgroundColor: Colors.deepPurple, // Set popup background to dark purple
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _copyToClipboard('Your Team Link');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 0, 0), // Set button color to dark blue
                  onPrimary: Colors.white, // Set text color to white
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set padding
                ),
                child: Text(
                  'Share Link',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Open contacts in your phone
                  // Implement your logic to open contacts
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, // Set button color to dark blue
                  onPrimary: Colors.white, // Set text color to white
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set padding
                ),
                child: Text(
                  'Open Contacts',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _copyToClipboard(String text) {
    // Implement logic to copy text to clipboard
  }
}

class ChatIcon extends StatelessWidget {
  final VoidCallback onTap;

  ChatIcon({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.chat,
        color: Colors.white,
      ),
      onPressed: onTap,
    );
  }
}
