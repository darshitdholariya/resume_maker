import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/screen/view_resume/logic/view_resume_event.dart';
import 'package:code/screen/view_resume/logic/view_resume_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add/logic/add_resume_state.dart';

class ViewResumeBloc extends Bloc<ViewResumeEvent, ViewResumeState> {
  ViewResumeBloc() : super(ViewResumeState()) {
    on<ViewResumeInitialEvent>(_homeInitialEvent);
    on<GetSingleResumeEvent>(_getSingleResumeEvent);
  }

  bool isLoading = false;
  String docId = '';
  String? name;
  String? email;
  String? address;
  String? mobile;
  String? course;
  String? university;
  String? score;
  String? year;
  String? companyName;
  String? jobTitle;
  String? startDate;
  String? endDate;
  String? details;
  String? skills;

  void _homeInitialEvent(
      ViewResumeInitialEvent event, Emitter<ViewResumeState> emit) {
    docId = event.docId;
    add(GetSingleResumeEvent());
  }

  Future<void> _getSingleResumeEvent(
      GetSingleResumeEvent event, Emitter<ViewResumeState> emit) async {
    isLoading = true;
    emit(ViewResumeLoadingState());
    try {
      final petsRef = FirebaseFirestore.instance.collection('database');
      final res = await petsRef.doc(docId).get();
      final Map<String, dynamic> data = Map<String, dynamic>.from(res.data()!);

      name = data['name'];
      email = data['email'];
      address = data['address'];
      mobile = data['mobile'];
      course = data['course'];
      university = data['university'];
      score = data['score'];
      year = data['year'];
      companyName = data['companyName'];
      jobTitle = data['jobTitle'];
      startDate = data['startDate'];
      endDate = data['endDate'];
      details = data['details'];
      skills = data['skills'];
    } catch (e) {
      return null;
    }

    isLoading = false;
    emit(ViewResumeLoadingState());
  }
}
