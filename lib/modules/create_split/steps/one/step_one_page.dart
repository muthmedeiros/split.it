import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title.dart';

class StepOnePage extends StatefulWidget {
  final void Function(String vaule) onChanged;
  const StepOnePage({Key? key, required this.onChanged}) : super(key: key);

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
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
