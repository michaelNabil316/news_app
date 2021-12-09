abstract class ScienceState {}

class ScienceInitialState extends ScienceState {}

class LoadedScienceState extends ScienceState {}

class ErrorScienceState extends ScienceState {
  final String errData;
  ErrorScienceState(this.errData);
}
