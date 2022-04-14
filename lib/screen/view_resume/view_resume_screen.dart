import 'package:code/shared_widget/view_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/view_resume_bloc.dart';
import 'logic/view_resume_event.dart';
import 'logic/view_resume_state.dart';

class ViewResumeScreen extends StatelessWidget {
  const ViewResumeScreen({Key? key, required this.docId}) : super(key: key);

  final String? docId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewResumeBloc>(
      create: (context) {
        return ViewResumeBloc()
          ..add(ViewResumeInitialEvent(
            docId: docId!,
          ));
      },
      child: const _ViewResumeScreen(),
    );
  }
}

class _ViewResumeScreen extends StatefulWidget {
  const _ViewResumeScreen({Key? key}) : super(key: key);

  @override
  _ViewResumeScreenState createState() => _ViewResumeScreenState();
}

class _ViewResumeScreenState extends State<_ViewResumeScreen> {
  late final ViewResumeBloc viewResumeBloc;

  @override
  void initState() {
    viewResumeBloc = BlocProvider.of<ViewResumeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewResumeBloc, ViewResumeState>(
      bloc: viewResumeBloc,
      listener: (BuildContext context, ViewResumeState state) {
        if (state is ViewResumeInitialState) {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'View Resume',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<ViewResumeBloc, ViewResumeState>(
            bloc: viewResumeBloc,
            buildWhen: (previous, current) {
              if (current is ViewResumeLoadingState) {
                return true;
              }
              return false;
            },
            builder: (BuildContext context, ViewResumeState state) {
              return viewResumeBloc.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  'Personal Details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ViewDetailTile(
                                label: 'Name',
                                value: viewResumeBloc.name,
                              ),
                              ViewDetailTile(
                                label: 'Email',
                                value: viewResumeBloc.email,
                              ),
                              ViewDetailTile(
                                label: 'Address',
                                value: viewResumeBloc.address,
                              ),
                              ViewDetailTile(
                                label: 'Mobile Number',
                                value: viewResumeBloc.mobile,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  'Education',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ViewDetailTile(
                                label: 'Course / Degree',
                                value: viewResumeBloc.course,
                              ),
                              ViewDetailTile(
                                label: 'School / University',
                                value: viewResumeBloc.university,
                              ),
                              ViewDetailTile(
                                label: 'Grade / Score',
                                value: viewResumeBloc.score,
                              ),
                              ViewDetailTile(
                                label: 'Year',
                                value: viewResumeBloc.year,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  'Experience',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ViewDetailTile(
                                label: 'Company Name',
                                value: viewResumeBloc.companyName,
                              ),
                              ViewDetailTile(
                                label: 'Job Title',
                                value: viewResumeBloc.jobTitle,
                              ),
                              ViewDetailTile(
                                label: 'Start Date',
                                value: viewResumeBloc.startDate,
                              ),
                              ViewDetailTile(
                                label: 'End Date',
                                value: viewResumeBloc.endDate,
                              ),
                              ViewDetailTile(
                                label: 'Details',
                                value: viewResumeBloc.details,
                              ),
                              ViewDetailTile(
                                label: 'Skills',
                                value: viewResumeBloc.skills,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
