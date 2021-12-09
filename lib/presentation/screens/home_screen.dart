import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/dark_mode_bloc/bloc.dart';
import 'package:news_app/business_logic/screens_bloc/bloc.dart';
import 'package:news_app/business_logic/screens_bloc/states.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screencubit = ScreensBloc.get(context);
    return BlocBuilder<ScreensBloc, ScreensStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Michael app'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  DarkModeBloc.get(context).changeDarkMode();
                },
                icon: const Icon(Icons.dark_mode),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: screencubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              screencubit.changeBtmNavBar(index);
            },
            items: screencubit.bottomNavItems,
          ),
          body: screencubit.screens[screencubit.currentIndex],
        );
      },
    );
  }
}
