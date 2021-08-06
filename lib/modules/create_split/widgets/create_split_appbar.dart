import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CreateSplitAppBar extends PreferredSize {
  final VoidCallback onTapBack;
  final int actualPage;
  final int size;

  CreateSplitAppBar({
    required this.onTapBack,
    required this.actualPage,
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
                    child: Text.rich(
                      TextSpan(
                        text: "0${actualPage + 1}",
                        style: AppTheme.textStyles.stepperIndicatorPrimary,
                        children: [
                          TextSpan(
                            text: " - 0$size",
                            style:
                                AppTheme.textStyles.stepperIndicatorSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(60));
}
