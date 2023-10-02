import 'package:flutter/material.dart';
import 'package:goalup/screens/searchpage.dart';
import 'package:goalup/screens/notification_page.dart';
import 'package:goalup/widgets/bottom_navigation.dart';
import 'package:goalup/widgets/chat.dart';
import 'package:goalup/widgets/hamburger.dart';

class HomePage extends StatelessWidget {
  final String loggedInUserName;

  HomePage({this.loggedInUserName = ''});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.deepPurple,
          actions: [
            // Keep only one of the hamburger menus
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            // Remove one of the hamburger menus (the one you want to remove)
            // IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {
            //     Scaffold.of(context).openDrawer();
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage(loggedInUserName: '',)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'To Do'),
              Tab(text: 'Done'),
            ],
          ),
        ),
        drawer: CommonDrawer(loggedInUserName: loggedInUserName),
        body: TabBarView(
          children: [
            Container(
              color: Color.fromARGB(255, 70, 3, 92),
              child: Center(
                child: Text(
                  'To Do Tab Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 70, 3, 92),
              child: Center(
                child: Text(
                  'Done Tab Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: 0,
          onTabTap: (index) {
            // Handle navigation based on the selected index
            // Example: navigate to different pages or update the body
          },
          onSearch: () {
            Navigator.pushNamed(context, '/search');
          },
          onAdd: () {
            _openAddForm(context);
          },
          backgroundColor: Color.fromARGB(255, 6, 11, 107),
        ),
      ),
    );
  }

  void _openAddForm(BuildContext context) {
    Navigator.pushNamed(context, '/add');
  }
}
