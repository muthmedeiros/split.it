import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class AddButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const AddButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 48,
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              width: 1.5,
              color: AppTheme.colors.addBorderHome,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          color: AppTheme.colors.addButton,
        ),
      ),
    );
  }
}
