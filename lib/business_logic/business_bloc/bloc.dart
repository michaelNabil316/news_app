import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/constants.dart';
import 'package:news_app/Data/dio_serviecs.dart';
import 'package:news_app/business_logic/business_bloc/states.dart';

class BussinessBloc extends Cubit<BussinessState> {
  BussinessBloc() : super(BusinessInitialState());
  static BussinessBloc get(context) => BlocProvider.of(context);
  List<dynamic> businessdata = [];

  void getBusinessData() {
    emit(BusinessInitialState());
    DioHelper.getData(
      path: newsMethodUrl,
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '605d3e0b96744cf69f60202cb4f7269e',
      },
    )
        .then(
          (value) => {
            businessdata = value.data['articles'],
            emit(LoadedBussinessState()),
          },
        )
        .catchError((err) => {
              emit(ErrorBusinessState(err.toString())),
            });
  }
}
