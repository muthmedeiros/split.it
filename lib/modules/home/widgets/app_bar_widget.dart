import 'package:flutter/material.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/modules/theme/app_theme.dart';

import 'pay_and_receive_container_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 19.0, right: 24.0, top: 62.0, bottom: 36.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              user.photoUrl!,
                              width: 67,
                              height: 62,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.name!,
                            style: AppTheme.textStyles.userNameHome,
                          ),
                        ],
                      ),
                      Container(
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PayAndReceiveContainerWidget(receive: true, amount: '124,00',),
                      PayAndReceiveContainerWidget(receive: false, amount: '48,00',),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
