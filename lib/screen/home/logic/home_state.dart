class HomeState {}

class HomeInitialState extends HomeState {
  @override
  String toString() {
    return 'HomeInitialState';
  }
}

class HomeLoadingState extends HomeState {
  @override
  String toString() {
    return 'HomeLoadingState';
  }
}
