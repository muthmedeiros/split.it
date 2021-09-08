import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../theme/app_theme.dart';
import '../create_split_controller.dart';
import 'stepper_next_button.dart';

class BottomStepperBar extends StatelessWidget {
  final CreateSplitController controller;

  const BottomStepperBar({
    Key? key,
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
    return Container(
      height: 61,
      child: Observer(
        builder: (_) => Column(
          children: [
            Container(
              color: controller.enableNavigateButton
                  ? AppTheme.colors.divider
                  : AppTheme.colors.dividerDisabled,
              width: double.maxFinite,
              height: 1,
            ),
            Row(
              children: [
                StepperNextButton(
                  label: 'Cancelar',
                  enabled: controller.enableNavigateButton,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: 1,
                  height: 60,
                  color: controller.enableNavigateButton
                      ? AppTheme.colors.divider
                      : AppTheme.colors.dividerDisabled,
                ),
                StepperNextButton(
                  label:
                      controller.currentPage == 2 ? 'Finalizar' : 'Continuar',
                  enabled: controller.enableNavigateButton,
                  colored: controller.currentPage == 2,
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
