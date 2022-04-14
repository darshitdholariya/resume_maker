class ViewResumeEvent {}

class ViewResumeInitialEvent extends ViewResumeEvent {
  ViewResumeInitialEvent({required this.docId});

  final String docId;

  @override
  String toString() {
    return 'ViewResumeInitialEvent';
  }
}


class GetSingleResumeEvent extends ViewResumeEvent {
  @override
  String toString() {
    return 'GetSingleResumeEvent';
  }
}