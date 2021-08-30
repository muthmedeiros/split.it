import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';

import '../../../theme/app_theme.dart';
import 'stepper_next_button.dart';

class BottomStepperBar extends StatelessWidget {
  final VoidCallback onTapCancel;
  final CreateSplitController controller;

  const BottomStepperBar({
    Key? key,
    required this.onTapCancel,
    required this.controller,
  }) : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

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
                  enabled: true,
                  onTap: onTapCancel,
                ),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                Observer(
                  builder: (_) => StepperNextButton(
                    label:
                        controller.currentPage == 2 ? 'Finalizar' : 'Continuar',
                    enabled: controller.enableNavigateButton,
                    onTap: onTapNext,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
