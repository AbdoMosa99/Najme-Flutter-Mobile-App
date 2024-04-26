abstract class HomeStates {
  const HomeStates();
}

class HomeInitial extends HomeStates {}

class GetSubjectsLoadingState extends HomeStates {}

class GetSubjectsSuccessfulLoadedState extends HomeStates {}

class GetSubjectsFailedLoadedState extends HomeStates {}
