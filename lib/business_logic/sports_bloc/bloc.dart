import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/constants.dart';
import 'package:news_app/Data/dio_serviecs.dart';
import 'package:news_app/business_logic/sports_bloc/states.dart';

class SportsBloc extends Cubit<SportsStates> {
  SportsBloc() : super(SportsInitialState());
  static SportsBloc get(context) => BlocProvider.of(context);
  List<dynamic> sportsdata = [];

  void getSportsData() {
    emit(SportsInitialState());
    DioHelper.getData(
      path: newsMethodUrl,
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '605d3e0b96744cf69f60202cb4f7269e',
      },
    )
        .then(
          (value) => {
            sportsdata = value.data['articles'],
            emit(LoadedSportsState()),
          },
        )
        .catchError((err) => {
              emit(ErrorSportsState(err.toString())),
            });
  }
}
