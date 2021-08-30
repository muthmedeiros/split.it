import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class StepInputText extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final TextAlign textAlign;
  final String? initialValue;
  final EdgeInsets? padding;
  final TextInputType keyboardType;
  final String? prefixText;
  final TextEditingController? controller;

  const StepInputText({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.textAlign = TextAlign.center,
    this.initialValue,
    this.padding,
    this.keyboardType = TextInputType.text,
    this.prefixText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        textAlign: textAlign,
        style: AppTheme.textStyles.textField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        decoration: InputDecoration(
          prefixText: prefixText,
          hintText: hintText,
          hintStyle: AppTheme.textStyles.hintTextField,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.inputBorder,
            ),
          ),
        ),
      ),
    );
  }
}
