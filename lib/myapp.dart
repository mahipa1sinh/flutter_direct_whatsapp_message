import 'package:flutter/material.dart';
import 'package:quick_sup/screens/about_screen.dart';
import 'package:quick_sup/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Sup',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey,
          elevation: 0.0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: '/',
      routes: {
        // '/': (context) => Home(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
