import 'package:flutter/material.dart';
//import 'package:goalup/screens/home_page.dart';
import 'package:goalup/screens/landing_page.dart';
//import 'screens/landing_page.dart';
import 'screens/environment_page.dart'; // Import the EnvironmentPage
import 'utils/constant.dart';
import 'package:goalup/screens/searchpage.dart';
import 'package:goalup/screens/upload_page.dart';
import 'package:goalup/screens/calendar_page.dart';
import 'package:goalup/screens/target.dart';
import 'package:goalup/screens/add.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        // Your theme data here
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/environment': (context) => EnvironmentPage(),
        '/search':(context) => SearchPage() ,
        '/upload':(context) => UploadPage(),
        '/calendar': (context) => CalendarPage(),
        '/target':(context) => TargetsPage(),
         '/add': (context) => AddPopup()
      },
    );
  }
}
