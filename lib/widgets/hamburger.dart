import 'package:flutter/material.dart';
import 'package:goalup/screens/profile_edit.dart';

class CommonDrawer extends StatefulWidget {
  final String loggedInUserName;

  CommonDrawer({required this.loggedInUserName});

  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.deepPurple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    widget.loggedInUserName.isNotEmpty
                        ? widget.loggedInUserName.substring(0, 2).toUpperCase()
                        : 'JD',
                    style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.deepPurple),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Logged In as',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                ),
                Text(
                  widget.loggedInUserName.isNotEmpty ? widget.loggedInUserName : 'John Doe',
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Search'),
            leading: Icon(Icons.search),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            title: Text('Calendar'),
            leading: Icon(Icons.calendar_today),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/calendar');
            },
          ),
          ListTile(
            title: Text('Environment'),
            leading: Icon(Icons.eco),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/environment');
            },
          ),
          ListTile(
            title: Text('Uploads'),
            leading: Icon(Icons.cloud_upload),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/upload');
            },
          ),
          ListTile(
            title: Text('Profile Edit'),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEditPage()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.lightbulb),
                SizedBox(width: 8),
                Text('Dark Mode'),
                Spacer(),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      _toggleDarkMode(value);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleDarkMode(bool isDarkMode) {
    
  }
}
