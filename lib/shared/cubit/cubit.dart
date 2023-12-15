import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> bottomNavBarScreens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> businessArticles= [];
  List<dynamic> sportsArticles= [];
  List<dynamic> scienceArticles= [];

  void changeCurrentIndex(int index){
    currentIndex = index;

    emit(BottomNavBarState());
  }

  void getBusiness(){

    emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
      'country':'us',
      'category':'business',
      'apiKey':'970bca636b994d51ab09cca3cdade332'
      }).then((value) {
        //print(value.data.toString());
        businessArticles = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) => print(error.toString()));
  }

  void getSports(){

    emit(NewsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'970bca636b994d51ab09cca3cdade332'
        }).then((value) {
      //print(value.data.toString());
      sportsArticles = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) => print(error.toString()));
  }

  void getScience(){
    emit(NewsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'970bca636b994d51ab09cca3cdade332'
        }).then((value) {
      //print(value.data.toString());
      scienceArticles = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) => print(error.toString()));
  }
}