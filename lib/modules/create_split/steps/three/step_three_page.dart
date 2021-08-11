import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(
          title: 'Qual ou quais',
          subtitle: '\nítens você quer dividir?',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  "1",
                ),
              ),
              Expanded(
                flex: 3,
                child: StepInputText(
                  padding: EdgeInsets.zero,
                  onChanged: (value) {},
                  hintText: 'Ex: Picanha',
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: StepInputText(
                  padding: EdgeInsets.zero,
                  onChanged: (value) {},
                  prefixText: 'R\$ ',
                  hintText: '0,00',
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
