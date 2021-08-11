import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

enum IconDolarType { send, receive }

class IconDolarWidget extends StatelessWidget {
  final IconDolarType type;

  const IconDolarWidget({Key? key, required this.type}) : super(key: key);

  Color get _backgroundColor => type == IconDolarType.receive
      ? AppTheme.colors.receiveAmountText.withOpacity(0.1)
      : AppTheme.colors.payAmountText.withOpacity(0.1);

  String get _pathImage =>
      'assets/images/dollar-${type == IconDolarType.receive ? 'receive' : 'send'}.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        _pathImage,
      ),
    );
  }
}
