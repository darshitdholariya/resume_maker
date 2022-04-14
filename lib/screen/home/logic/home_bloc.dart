import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('database')
      .orderBy('created_date', descending: true)
      .snapshots();
  bool isLoading = false;

  void _homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    isLoading = true;
    emit(HomeLoadingState());





    isLoading = false;
    emit(HomeLoadingState());
  }
}
