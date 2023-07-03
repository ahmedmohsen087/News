import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/buildItem.dart';

import '../Search/search.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
                //NavigateTo(context, SearchScreen());

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
    );
  }
}
