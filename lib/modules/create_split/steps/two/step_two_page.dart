import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../create_split/widgets/person_tile.dart';
import '../../../create_split/widgets/step_input_text.dart';
import '../../../create_split/widgets/step_title.dart';
import '../../create_split_controller.dart';
import 'step_two_controller.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController createController;
  const StepTwoPage({
    Key? key,
    required this.createController,
  }) : super(key: key);

  @override
  _StepState createState() => _StepState();
}

class _StepState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller = StepTwoController(controller: widget.createController);
    controller.getFriends();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(
          title: 'Com quem',
          subtitle: '\nvocê quer dividir?',
        ),
        StepInputText(
          hintText: 'Nome da Pessoa',
          onChanged: (value) => controller.onChange(value),
        ),
        SizedBox(
          height: 35.0,
        ),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(
              children: [
                ...controller.selectedFriends
                    .map(
                      (e) => PersonTile(
                        data: e,
                        isRemovable: true,
                        onPressed: () => controller.removeFriend(e),
                      ),
                    )
                    .toList(),
                SizedBox(
                  height: 16.0,
                ),
              ],
            );
          }
        }),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text('Nenhum amigo encontrado.');
          } else {
            return Column(
              children: controller.items
                  .map(
                    (e) => PersonTile(
                      data: e,
                      onPressed: () => controller.addFriend(e),
                    ),
                  )
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
