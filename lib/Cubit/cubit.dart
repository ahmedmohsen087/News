import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Bottom_Bar/Business/Sports.dart';
import 'package:news/Bottom_Bar/Science/Business.dart';
import 'package:news/Bottom_Bar/Settings/Seetings.dart';
import 'package:news/Bottom_Bar/Sports/Science.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/Dio/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> bottomsItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Seetings'),

  ];

  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
    Seetings(),
  ];


  void changeBottomNavBar (index){
    curentIndex = index;
    emit(NewsBottomNavStates());
  }

  List<dynamic> business =[];

  void getBusiness (){
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'f41a8fe642d2434996018cb1fa13d48c',
        }).then((value) {
      print(value.data.toString());
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessStates());
    } ).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }
}
