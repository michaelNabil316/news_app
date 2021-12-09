abstract class SportsStates {}

class SportsInitialState extends SportsStates {}

class LoadedSportsState extends SportsStates {}

class ErrorSportsState extends SportsStates {
  final String errorData;
  ErrorSportsState(this.errorData);
}
