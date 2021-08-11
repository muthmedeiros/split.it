import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../login/models/user_model.dart';
import '../add_button_widget.dart';
import '../bottom_app_bar/bottom_app_bar_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;

  AppBarWidget({required this.user, required this.onTapAddButton})
      : super(
          preferredSize: Size.fromHeight(328),
          child: Container(
            height: 328,
            child: Stack(
              children: [
                Container(
                  height: 244,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppTheme.gradients.background,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 62.0),
                      child: ListTile(
                        leading: ClipRRect(
                          child: Image.network(
                            user.photoUrl!,
                            width: 67,
                            height: 62,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(
                          user.name!,
                          style: AppTheme.textStyles.nameAppBarHome,
                        ),
                        trailing: AddButtonWidget(
                          onTap: onTapAddButton,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    BottomAppBarWidget()
                  ],
                ),
              ],
            ),
          ),
        );
}
