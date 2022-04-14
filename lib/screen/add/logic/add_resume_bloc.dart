import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/screen/add/add_resume_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_resume_event.dart';
import 'add_resume_state.dart';

class AddResumeBloc extends Bloc<AddResumeEvent, AddResumeState> {
  AddResumeBloc() : super(AddResumeState()) {
    on<AddResumeInitialEvent>(_addResumeInitialEvent);
    on<SaveResumeEvent>(_saveResumeEvent);
    on<GetSingleResumeEvent>(_getSingleResumeEvent);
    on<UpdateResumeEvent>(_updateResumeEvent);
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController score = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController skills = TextEditingController();

  bool isLoading = false;
  String docId = '';
  TaskType task = TaskType.add;

  void _addResumeInitialEvent(
      AddResumeInitialEvent event, Emitter<AddResumeState> emit) {
    if (event.docId != null) {
      docId = event.docId!;
    }
    if (event.task == TaskType.edit) {
      task = TaskType.edit;
    }

    if (task == TaskType.edit) {
      add(GetSingleResumeEvent());
    }
  }

  Future<void> _saveResumeEvent(
      SaveResumeEvent event, Emitter<AddResumeState> emit) async {
    isLoading = true;
    emit(AddResumeLoadingState());
    await FirebaseFirestore.instance.collection('database').add({
      "name": name.text,
      "email": email.text,
      "address": address.text,
      "mobile": mobile.text,
      "course": course.text,
      "university": university.text,
      "score": score.text,
      "year": year.text,
      "companyName": companyName.text,
      "jobTitle": jobTitle.text,
      "startDate": startDate.text,
      "endDate": endDate.text,
      "details": details.text,
      "skills": skills.text,
      "created_date": Timestamp.now(),
    });

    isLoading = false;
    emit(AddResumeLoadingState());
  }

  Future<void> _getSingleResumeEvent(
      GetSingleResumeEvent event, Emitter<AddResumeState> emit) async {
    isLoading = true;
    emit(AddResumeLoadingState());
    try {
      final petsRef = FirebaseFirestore.instance.collection('database');
      final res = await petsRef.doc(docId).get();
      final Map<String, dynamic> data = Map<String, dynamic>.from(res.data()!);

      name.text = data['name'];
      email.text = data['email'];
      address.text = data['address'];
      mobile.text = data['mobile'];
      course.text = data['course'];
      university.text = data['university'];
      score.text = data['score'];
      year.text = data['year'];
      companyName.text = data['companyName'];
      jobTitle.text = data['jobTitle'];
      startDate.text = data['startDate'];
      endDate.text = data['endDate'];
      details.text = data['details'];
      skills.text = data['skills'];
    } catch (e) {
      return null;
    }

    isLoading = false;
    emit(AddResumeLoadingState());
  }

  Future<void> _updateResumeEvent(
      UpdateResumeEvent event, Emitter<AddResumeState> emit) async {
    isLoading = true;
    emit(AddResumeLoadingState());
    await FirebaseFirestore.instance.collection('database').doc(docId).update({
      "name": name.text,
      "email": email.text,
      "address": address.text,
      "mobile": mobile.text,
      "course": course.text,
      "university": university.text,
      "score": score.text,
      "year": year.text,
      "companyName": companyName.text,
      "jobTitle": jobTitle.text,
      "startDate": startDate.text,
      "endDate": endDate.text,
      "details": details.text,
      "skills": skills.text,
    });

    isLoading = false;
    emit(AddResumeLoadingState());
  }
}
