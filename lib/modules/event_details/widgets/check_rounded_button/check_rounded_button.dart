import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:split_it/modules/event_details/widgets/check_rounded_button/check_rounded_button_controller.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

class CheckRoundedButton extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  final Function(EventModel newEvent) onChanged;

  const CheckRoundedButton({
    Key? key,
    required this.event,
    required this.friend,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckRoundedButtonState createState() => _CheckRoundedButtonState();
}

class _CheckRoundedButtonState extends State<CheckRoundedButton> {
  late CheckRoundedButtonController controller;

  Color get backgroundColor => controller.status == CheckRoundedStatus.success
      ? Color(0xFF40B28C).withOpacity(0.16)
      : Color(0xFF455250).withOpacity(0.08);

  Color get centerColor => controller.status == CheckRoundedStatus.success
      ? Color(0xFF40B28C)
      : Colors.white;

  @override
  void initState() {
    controller = CheckRoundedButtonController(
      repository: FirebaseRepository(),
      event: widget.event,
    );
    if (widget.friend.paid) {
      controller.status = CheckRoundedStatus.success;
    }
    autorun((_) {
      if (controller.status == CheckRoundedStatus.success ||
          controller.status == CheckRoundedStatus.empty) {
        widget.onChanged(controller.event);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () => controller.update(widget.friend),
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: centerColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Center(
                  child: controller.status == CheckRoundedStatus.success
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFFC0CCC9), width: 2.0),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
