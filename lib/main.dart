import 'package:flutter/material.dart';
import 'package:news/Dio/dio_helper.dart';

import 'Home_Screen/HomeScreen.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,


          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )

        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 5.0
        )

      ),
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}


