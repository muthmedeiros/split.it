import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get title;
  Color get button;
  Color get border;
  Color get nameAppBarHome;
  Color get addBorderHome;
  Color get appBarContainers;
  Color get appBarContainersBorder;
  Color get infoCardTitle;
  Color get receiveAmountText;
  Color get payAmountText;
  Color get addButton;
  Color get eventTileTitle;
  Color get eventTileSubtitle;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get divider;
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
  Color get nameAppBarHome => Color(0xFFFFFFFF);

  @override
  Color get addBorderHome => Color(0xFFFFFFFF).withOpacity(0.25);

  @override
  Color get appBarContainers => Color(0xFFFFFFFF);

  @override
  Color get appBarContainersBorder => Color(0xFFDCE0E5);

  @override
  Color get infoCardTitle => Color(0xFF666666);

  @override
  Color get receiveAmountText => Color(0xFF40B28C);

  @override
  Color get payAmountText => Color(0xFFE83F5B);

  @override
  Color get addButton => Color(0xFFF5F5F5);

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTilePeople => Color(0xFFA4B2AE);

  @override
  Color get eventTileSubtitle => Color(0xFF666666);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get divider => Color(0xFF666666);
}
