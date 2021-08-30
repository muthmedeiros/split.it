import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../create_split_controller.dart';
import '../../widgets/add_text_button.dart';
import '../../widgets/step_multi_input_text.dart';
import '../../widgets/step_title.dart';
import 'step_three_controller.dart';

class StepThreePage extends StatefulWidget {
  final CreateSplitController createController;
  const StepThreePage({
    Key? key,
    required this.createController,
  }) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  final controller = StepThreeController();

  @override
  void initState() {
    autorun((_) {
      widget.createController.onChanged(items: controller.items.toList());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitle(
            title: 'Qual ou quais',
            subtitle: '\nítens você quer dividir?',
          ),
          Observer(
            builder: (_) => StepMultiInputText(
              key: UniqueKey(),
              count: controller.currentIndex,
              itemName: (value) {
                controller.onChanged(name: value);
              },
              itemValue: (value) {
                controller.onChanged(value: value);
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Observer(
            builder: (_) => controller.showButton
                ? AddTextButton(
                    label: "Continuar",
                    onPressed: () {
                      controller.addItem();
                    },
                  )
                : SizedBox(
                    height: 24,
                  ),
          ),
          Observer(
            builder: (_) => Column(
              children: [
                for (var i = 0; i < controller.items.length; i++)
                  StepMultiInputText(
                    key: Key([i].hashCode.toString()),
                    isRemoved: true,
                    initialName: controller.items[i].name,
                    initialValue: controller.items[i].value,
                    count: i + 1,
                    itemName: (value) => controller.editItem(i, name: value),
                    itemValue: (value) => controller.editItem(i, value: value),
                    onDelete: () {
                      controller.removeItem(i);
                    },
                  )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
