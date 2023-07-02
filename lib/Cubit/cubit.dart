import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Bottom_Bar/Settings/Seetings.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/Dio/cache_helper.dart';
import 'package:news/Dio/dio_helper.dart';

import '../Bottom_Bar/Business/Business.dart';
import '../Bottom_Bar/Science/Science.dart';
import '../Bottom_Bar/Sports/Sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> bottomsItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),


  ];

  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];


  void changeBottomNavBar (index){
    curentIndex = index;
    emit(NewsBottomNavStates());
  }

  List<dynamic> business =[];


  void getBusiness (){
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(url: 'v4/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'157b4c47bb741c8688fc93a8e5ca3727',
        }).then((value) {
      //print(value.data.toString());
      business=value.data['articles'];
     // print(business[0]['title']);
      emit(NewsGetBusinessSuccessStates());
    } ).catchError((error){
     // print(error.toString());
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }
  List<dynamic> sports =[];

  void getSports (){
    emit(NewsGetSportsLoadingStates());
    DioHelper.getData(url: 'v4/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apikey':'157b4c47bb741c8688fc93a8e5ca3727',
        }).then((value) {
      //print(value.data.toString());
      sports=value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetSportsSuccessStates());
    } ).catchError((error){
      // print(error.toString());
      emit(NewsGetSportsErrorStates(error.toString()));
    });
  }

  List<dynamic> science =[];

  void getScience (){
    emit(NewsGetScienceLoadingStates());
    DioHelper.getData(url: 'v4/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apikey':'157b4c47bb741c8688fc93a8e5ca3727',
        }).then((value) {
      //print(value.data.toString());
      science=value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetScienceSuccessStates());
    } ).catchError((error){
      // print(error.toString());
      emit(NewsGetScienceErrorStates(error.toString()));
    });
  }

  bool isDark = false ;

  void changeAppMode (){
    isDark =!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeStates());
    });
  }

  List<dynamic> Search =[];

  void getSearch (String value ){
    emit(NewsGetSearchLoadingStates());
    DioHelper.getData(
        url: 'v4/search',
        query: {
          'country':'eg',
          'q':'$value',
          'apikey':'157b4c47bb741c8688fc93a8e5ca3727',
        }).then((value) {
      //print(value.data.toString());
      Search=value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetSearchSuccessStates());
    } ).catchError((error){
      // print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }

}


