import 'package:flutter/material.dart';

import '../../../create_split/widgets/step_input_text.dart';
import '../../../create_split/widgets/step_title.dart';
import '../../create_split_controller.dart';

class StepOnePage extends StatefulWidget {
  final CreateSplitController createController;
  const StepOnePage({
    Key? key,
    required this.createController,
  }) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(
          title: 'Qual o nome',
          subtitle: '\ndo evento',
        ),
        StepInputText(
          hintText: "Ex: churrasco",
          onChanged: (value) => widget.createController.onChanged(name: value),
        ),
      ],
    );
  }
}
