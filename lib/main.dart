import 'package:flutter/material.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/Dio/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Home_Screen/HomeScreen.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
              ),

            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  color: Colors.white30,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  )

              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: Colors.white30,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 5.0,
                backgroundColor: Colors.white30,
                unselectedItemColor: Colors.white,

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),

            ),
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:  HomeScreen(),
          );
        },
      ),

    );

  }

}


