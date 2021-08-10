import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputText extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final TextAlign textAlign;
  final EdgeInsets? padding;
  final TextInputType? keyboardType;
  final String? prefixText;

  const StepInputText({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.textAlign = TextAlign.center,
    this.padding,
    this.keyboardType,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64.0),
      child: TextField(
        keyboardType: keyboardType ?? TextInputType.text,
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
