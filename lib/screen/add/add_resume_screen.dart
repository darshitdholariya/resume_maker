import 'package:code/shared_widget/custom_button.dart';
import 'package:code/shared_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/add_resume_bloc.dart';
import 'logic/add_resume_event.dart';
import 'logic/add_resume_state.dart';

enum TaskType { add, edit }

class AddResumeScreen extends StatelessWidget {
  const AddResumeScreen({Key? key, this.task = TaskType.add, this.docId})
      : super(key: key);
  final TaskType task;
  final String? docId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddResumeBloc>(
      create: (context) {
        return AddResumeBloc()
          ..add(AddResumeInitialEvent(task: task, docId: docId));
      },
      child: _AddResumeScreen(task: task),
    );
  }
}

class _AddResumeScreen extends StatefulWidget {
  const _AddResumeScreen({Key? key, required this.task}) : super(key: key);
  final TaskType task;

  @override
  _AddResumeScreenState createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends State<_AddResumeScreen> {
  late final AddResumeBloc addResumeBloc;

  @override
  void initState() {
    addResumeBloc = BlocProvider.of<AddResumeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddResumeBloc, AddResumeState>(
      bloc: addResumeBloc,
      listener: (BuildContext context, AddResumeState state) {
        if (state is AddResumeInitialState) {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.task == TaskType.add ? 'Add Resume' : 'Edit Resume',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<AddResumeBloc, AddResumeState>(
            bloc: addResumeBloc,
            buildWhen: (previous, current) {
              if (current is AddResumeLoadingState) {
                return true;
              }
              return false;
            },
            builder: (BuildContext context, AddResumeState state) {
              return addResumeBloc.isLoading
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
                              /// personal
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Personal Details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: addResumeBloc.name,
                                hint: 'Enter Name here',
                                label: 'Name',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.email,
                                hint: 'Enter email here',
                                label: 'Email',
                                inputType: TextInputType.emailAddress,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.address,
                                hint: 'Enter address here',
                                label: 'Address',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.mobile,
                                hint: 'Enter mobile number here',
                                label: 'Mobile Number',
                                inputType: TextInputType.phone,
                              ),

                              /// Education
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Education',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: addResumeBloc.course,
                                hint: 'Enter Course / Degree here',
                                label: 'Course / Degree',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.university,
                                hint: 'Enter School / University here',
                                label: 'School / University',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.score,
                                hint: 'Enter Grade / Score here',
                                label: 'Grade / Score',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.year,
                                hint: 'Enter Year here',
                                label: 'Year',
                                inputType: TextInputType.number,
                              ),

                              /// Experience
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Experience',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              CustomTextField(
                                controller: addResumeBloc.companyName,
                                hint: 'Enter Company name here',
                                label: 'Company name',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.jobTitle,
                                hint: 'Enter Job Title here',
                                label: 'Job Title',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.startDate,
                                hint: 'Enter Start Date here',
                                label: 'Start Date',
                                inputType: TextInputType.datetime,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.endDate,
                                hint: 'Enter End Date here',
                                label: 'End Date',
                                inputType: TextInputType.datetime,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.details,
                                hint: 'Enter Details here',
                                label: 'Details',
                                inputType: TextInputType.text,
                              ),
                              CustomTextField(
                                controller: addResumeBloc.skills,
                                hint: 'Enter skills list here',
                                label: 'Skills',
                                inputType: TextInputType.text,
                              ),

                              /// Save
                              const SizedBox(
                                height: 50,
                              ),
                              CustomButton(
                                title: 'Save',
                                onTap: widget.task == TaskType.add
                                    ? () {
                                        addResumeBloc.add(SaveResumeEvent());
                                        Navigator.pop(context);
                                      }
                                    : () {
                                        addResumeBloc.add(UpdateResumeEvent());
                                        Navigator.pop(context);
                                      },
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
