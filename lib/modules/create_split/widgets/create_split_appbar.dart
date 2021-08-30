import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';

import '../../../theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onTapBack;
  final CreateSplitController controller;
  final int size;

  CreateSplitAppBar({
    required this.onTapBack,
    required this.controller,
    required this.size,
  }) : super(
            child: SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppTheme.colors.backButton,
                      ),
                      onPressed: onTapBack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Observer(builder: (_) {
                      return Text.rich(
                        TextSpan(
                            text: "0${controller.currentPage + 1}",
                          style: AppTheme.textStyles.stepperIndicatorPrimary,
                          children: [
                            TextSpan(
                              text: " - 0$size",
                              style:
                                  AppTheme.textStyles.stepperIndicatorSecondary,
                            ),
                          ],
                        ),
                        );
                    }
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60));
}
