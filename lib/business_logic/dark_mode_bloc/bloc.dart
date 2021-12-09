import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/dark_mode_bloc/states.dart';

import 'shared_pref.dart';

class DarkModeBloc extends Cubit<DarkModeState> {
  DarkModeBloc() : super(DarkModeInitialState());
  static DarkModeBloc get(context) => BlocProvider.of(context);
  bool isDarkMode = false;

  void setFirstIsDark() {
    final data = SharedPrefHelper.getIsDarkPref();
    if (data == null) {
      SharedPrefHelper.setIsDarkPref(value: false);
    } else {
      isDarkMode = data;
    }
    emit(ChangeDarkModeState());
  }

  void changeDarkMode() {
    isDarkMode = !isDarkMode;
    SharedPrefHelper.setIsDarkPref(value: isDarkMode);
    emit(ChangeDarkModeState());
  }
}
