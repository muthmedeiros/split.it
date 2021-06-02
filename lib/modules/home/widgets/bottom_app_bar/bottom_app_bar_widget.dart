import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

import '../info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();
  @override
  void initState() {
    controller.getDashboard();
    controller.listen((appBarState) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.appBarState.runtimeType) {
      case AppBarStateLoading:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCardWidget(
                value: 0,
                isLoading: true,
              ),
              InfoCardWidget(
                value: 0,
                isLoading: true,
              ),
            ],
          );
        }
      case AppBarStateSuccess:
        {
          final dashboard =
              (controller.appBarState as AppBarStateSuccess).dashboard;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCardWidget(
                value: dashboard.receive,
              ),
              InfoCardWidget(
                value: -dashboard.send,
              ),
            ],
          );
        }
      case AppBarStateFailure:
        {
          final message =
              (controller.appBarState as AppBarStateFailure).message;
          return Text(message);
        }
      default:
        {
          return Container();
        }
    }
  }
}
