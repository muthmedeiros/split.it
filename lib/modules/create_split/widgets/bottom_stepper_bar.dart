import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import 'stepper_next_button.dart';

class BottomStepperBar extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final bool enabledButtons;

  const BottomStepperBar({
    Key? key,
    required this.onTapCancel,
    required this.onTapNext,
    this.enabledButtons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                StepperNextButton(
                  label: 'Cancelar',
                  enabled: enabledButtons,
                  onTap: onTapCancel,
                ),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                StepperNextButton(
                  label: 'Continuar',
                  enabled: enabledButtons,
                  onTap: onTapNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
