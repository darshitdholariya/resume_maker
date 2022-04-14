import '../add_resume_screen.dart';

class AddResumeEvent {}

class AddResumeInitialEvent extends AddResumeEvent {
  AddResumeInitialEvent({required this.docId, required this.task});

  final TaskType task;
  final String? docId;

  @override
  String toString() {
    return 'AddResumeInitialEvent';
  }
}

class SaveResumeEvent extends AddResumeEvent {
  @override
  String toString() {
    return 'SaveResumeEvent';
  }
}

class GetSingleResumeEvent extends AddResumeEvent {
  @override
  String toString() {
    return 'GetSingleResumeEvent';
  }
}

class UpdateResumeEvent extends AddResumeEvent {
  @override
  String toString() {
    return 'UpdateResumeEvent';
  }
}
