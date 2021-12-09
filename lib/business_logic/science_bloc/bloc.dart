import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/constants.dart';
import 'package:news_app/Data/dio_serviecs.dart';
import 'package:news_app/business_logic/science_bloc/states.dart';

class ScienceBloc extends Cubit<ScienceState> {
  ScienceBloc() : super(ScienceInitialState());
  static ScienceBloc get(context) => BlocProvider.of(context);
  List<dynamic> sciencedata = [];

  void getScienceData() {
    emit(ScienceInitialState());
    DioHelper.getData(
      path: newsMethodUrl,
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '605d3e0b96744cf69f60202cb4f7269e',
      },
    )
        .then(
          (value) => {
            sciencedata = value.data['articles'],
            emit(LoadedScienceState()),
          },
        )
        .catchError((err) => {
              emit(ErrorScienceState(err.toString())),
            });
  }
}
