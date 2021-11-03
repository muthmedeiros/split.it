import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/event_details/event_details_page.dart';

import '../../shared/models/event_model.dart';
import '../home/home_controller.dart';
import '../home/home_state.dart';
import '../home/widgets/app_bar/app_bar_widget.dart';
import '../home/widgets/event_tile_widget.dart';
import '../login/models/user_model.dart';
import 'repositories/home_repository_firebase.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(homeRepository: HomeRepositoryFirebase());

  @override
  void initState() {
    controller.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () async {
          await Navigator.pushNamed(context, "/create_split");
          controller.getEvents();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (context) {
                if (controller.state is HomeStateLoading) {
                  return Column(
                    children: List.generate(
                      5,
                      (index) => EventTileWidget(
                        eventModel: EventModel(),
                        isLoading: true,
                      ),
                    ),
                  );
                } else if (controller.state is HomeStateSuccess) {
                  return Column(
                    children: (controller.state as HomeStateSuccess)
                        .events
                        .map(
                          (e) => EventTileWidget(
                            eventModel: e,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventDetailsPage(
                                    event: e,
                                  ),
                                ),
                              );
                              controller.getEvents();
                            },
                          ),
                        )
                        .toList(),
                  );
                } else if (controller.state is HomeStateFailure) {
                  return Text((controller.state as HomeStateFailure).message);
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
