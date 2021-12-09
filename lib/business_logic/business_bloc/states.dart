abstract class BussinessState {}

class BusinessInitialState extends BussinessState {}

class LoadedBussinessState extends BussinessState {}

class ErrorBusinessState extends BussinessState {
  final String errorData;
  ErrorBusinessState(this.errorData);
}
