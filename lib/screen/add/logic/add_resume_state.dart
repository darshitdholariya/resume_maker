class AddResumeState {}

class AddResumeInitialState extends AddResumeState {
  @override
  String toString() {
    return 'AddResumeInitialState';
  }
}

class AddResumeLoadingState extends AddResumeState {
  @override
  String toString() {
    return 'AddResumeLoadingState';
  }
}
