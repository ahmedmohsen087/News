import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports
        ()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: () {

              },
                  icon: Icon(Icons.search)),
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                      NewsCubit.get(context).changeAppMode();
                  },
                ),

              ],
            ),
            body: cubit.screens[cubit.curentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.curentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomsItem),
          );
        },
      ),
    );
  }
}
