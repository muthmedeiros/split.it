import 'package:flutter/material.dart';

import '../../shared/models/event_model.dart';
import '../home/home_controller.dart';
import '../home/home_state.dart';
import '../home/widgets/app_bar/app_bar_widget.dart';
import '../home/widgets/event_tile_widget.dart';
import '../login/models/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen((homeState) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, "/create_split");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.homeState is HomeStateLoading) ...[
                ...List.generate(
                    5,
                    (index) => EventTileWidget(
                          eventModel: EventModel(),
                          isLoading: true,
                        ))
              ] else if (controller.homeState is HomeStateSuccess) ...[
                ...(controller.homeState as HomeStateSuccess)
                    .events
                    .map(
                      (e) => EventTileWidget(eventModel: e),
                    )
                    .toList()
              ] else if (controller.homeState is HomeStateFailure) ...[
                Text((controller.homeState as HomeStateFailure).message)
              ] else ...[
                Container(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
