import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/business_bloc/bloc.dart';
import 'package:news_app/business_logic/science_bloc/bloc.dart';
import 'package:news_app/business_logic/screens_bloc/bloc.dart';
import 'package:news_app/business_logic/sports_bloc/bloc.dart';
import 'package:news_app/presentation/style.dart';
import 'Data/dio_serviecs.dart';
import 'business_logic/dark_mode_bloc/bloc.dart';
import 'business_logic/dark_mode_bloc/shared_pref.dart';
import 'business_logic/dark_mode_bloc/states.dart';
import 'presentation/screens/on_boarding_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedPrefHelper.initDarkModePref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DarkModeBloc>(
            create: (context) => DarkModeBloc()..setFirstIsDark()),
        BlocProvider<ScreensBloc>(create: (context) => ScreensBloc()),
        BlocProvider<BussinessBloc>(
            create: (context) => BussinessBloc()..getBusinessData()),
        BlocProvider<SportsBloc>(
            create: (context) => SportsBloc()..getSportsData()),
        BlocProvider<ScienceBloc>(
            create: (context) => ScienceBloc()..getScienceData()),
      ],
      child: BlocBuilder<DarkModeBloc, DarkModeState>(
        builder: (context, state) {
          final darkModeCubit = DarkModeBloc.get(context);
          return MaterialApp(
            title: 'Michael app',
            //showPerformanceOverlay: true,
            debugShowCheckedModeBanner: false,
            themeMode:
                darkModeCubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: customLightThemeData,
            darkTheme: customDarkThemeData,
            home: const OnBoarding(),
          );
        },
      ),
    );
  }
}
