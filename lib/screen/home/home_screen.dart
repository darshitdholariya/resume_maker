import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/screen/add/add_resume_screen.dart';
import 'package:code/shared_widget/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/color.dart';
import '../../shared_widget/custom_list_tile.dart';
import 'logic/home_bloc.dart';
import 'logic/home_event.dart';
import 'logic/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        return HomeBloc()..add(HomeInitialEvent());
      },
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (BuildContext context, HomeState state) {
        if (state is HomeInitialState) {}
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddResumeScreen(),
                  ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            buildWhen: (previous, current) {
              if (current is HomeLoadingState) {
                return true;
              }
              return false;
            },
            builder: (BuildContext context, HomeState state) {
              return homeBloc.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: homeBloc.usersStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: kColorDarkNavy,
                                ),
                              );
                            }

                            return ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                String? docId = document.id;
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    CustomListTile(data: data, docId: docId),
                                    const Divider(),
                                  ],
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
