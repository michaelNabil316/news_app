import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/screens_bloc/states.dart';
import 'package:news_app/presentation/screens/business_screen.dart';
import 'package:news_app/presentation/screens/find_us_screen.dart';
import 'package:news_app/presentation/screens/science_screen.dart';
import 'package:news_app/presentation/screens/sports_screen.dart';

class ScreensBloc extends Cubit<ScreensStates> {
  ScreensBloc() : super(ScreensInitialState());
  static ScreensBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), title: Text('business')),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball), title: Text('sports')),
    BottomNavigationBarItem(icon: Icon(Icons.science), title: Text('science')),
    BottomNavigationBarItem(
        icon: Icon(Icons.location_on_outlined), title: Text('find us')),
  ];

  List screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    FindUs(),
  ];

  void changeBtmNavBar(int index) {
    currentIndex = index;
    emit(ChangedScreenState());
  }
}
