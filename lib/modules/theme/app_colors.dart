import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get title;
  Color get button;
  Color get border;
  Color get userNameHome;
  Color get addBorderHome;
  Color get appBarContainers;
  Color get appBarContainersBorder;
  Color get payOrReceiveText;
  Color get receiveAmountText;
  Color get payAmountText;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecondary => Color(0xFF40B38C);

  @override
  Color get title => Color(0xFF40B28C);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E6);

  @override
  Color get userNameHome => Color(0xFFFFFFFF);

  @override
  Color get addBorderHome => Color(0xFFFFFFFF).withOpacity(0.25);

  @override
  Color get appBarContainers => Color(0xFFFFFFFF);

  @override
  Color get appBarContainersBorder => Color(0xFFDCE0E5);

  @override
  Color get payOrReceiveText => Color(0xFF666666);

  @override
  Color get receiveAmountText => Color(0xFF40B28C);

  @override
  Color get payAmountText => Color(0xFFE83F5B);
}
