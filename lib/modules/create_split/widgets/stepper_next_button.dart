import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class StepperNextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enabled;

  const StepperNextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: enabled ? onTap : null,
        child: Text(
          label,
          style: enabled
              ? AppTheme.textStyles.stepperNextButton
              : AppTheme.textStyles.stepperNextButtonDisabled,
        ),
      ),
    );
  }
}
