import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'step_input_text.dart';

class StepMultiInputText extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initialValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;
  final bool isRemoved;

  StepMultiInputText({
    Key? key,
    required this.count,
    this.initialName,
    this.initialValue,
    required this.itemName,
    required this.itemValue,
    this.onDelete,
    this.isRemoved = false,
  }) : super(key: key);

  @override
  _StepMultiInputTextState createState() => _StepMultiInputTextState();
}

class _StepMultiInputTextState extends State<StepMultiInputText> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
    initialValue: widget.initialValue ?? 0.0,
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              "${widget.count}",
            ),
          ),
          Expanded(
            flex: 3,
            child: StepInputText(
              initialValue: widget.initialName,
              padding: EdgeInsets.zero,
              onChanged: (value) => widget.itemName(value),
              hintText: 'Ex: Picanha',
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: StepInputText(
              controller: valueInputTextController,
              padding: EdgeInsets.zero,
              onChanged: (value) =>
                  widget.itemValue(valueInputTextController.numberValue),
              //prefixText: 'R\$ ',
              hintText: 'R\$ 0,00',
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
            ),
          ),
          if (widget.isRemoved)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                if (widget.onDelete != null) {
                  widget.onDelete!();
                }
              },
            ),
        ],
      ),
    );
  }
}
