class ViewResumeState {}

class ViewResumeInitialState extends ViewResumeState {
  @override
  String toString() {
    return 'ViewResumeInitialState';
  }
}

class ViewResumeLoadingState extends ViewResumeState {
  @override
  String toString() {
    return 'ViewResumeLoadingState';
  }
}