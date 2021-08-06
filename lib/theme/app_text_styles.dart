import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get nameAppBarHome;
  TextStyle get infoCardTitle;
  TextStyle get receiveAmount;
  TextStyle get payAmount;
  TextStyle get eventTileTile;
  TextStyle get eventTileSubtitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTilePeople;
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecondary;
  TextStyle get stepperNextButton;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get stepperTitle;
  TextStyle get stepperSubtitle;
  TextStyle get hintTextField;
  TextStyle get textField;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.title,
      );

  @override
  TextStyle get nameAppBarHome => GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.nameAppBarHome,
      );

  @override
  TextStyle get infoCardTitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.infoCardTitle,
      );

  @override
  TextStyle get receiveAmount => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.receiveAmountText,
      );

  @override
  TextStyle get payAmount => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.payAmountText,
      );

  @override
  TextStyle get eventTileMoney => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileMoney,
      );

  @override
  TextStyle get eventTilePeople => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTilePeople,
      );

  @override
  TextStyle get eventTileSubtitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileSubtitle,
      );

  @override
  TextStyle get eventTileTile => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.eventTileTitle,
      );

  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperIndicatorPrimary,
      );

  @override
  TextStyle get stepperIndicatorSecondary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperIndicatorSecondary,
      );

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButton,
      );

  @override
  TextStyle get stepperSubtitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperSubtitle,
      );

  @override
  TextStyle get stepperTitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperTitle,
      );

  @override
  TextStyle get hintTextField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.hintTextField,
      );

  @override
  TextStyle get textField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textField,
      );

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButtonDisabled,
      );
}
