import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => "Poppins";

  TextStyle get baseTitleScreen => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: ColorsApp.instance.blackNormal,
      letterSpacing: 0.6,
      fontFamily: font);

  TextStyle get baseTitleProduct => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      fontFamily: font);

  TextStyle get baseDescription => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: ColorsApp.instance.blackNormal,
      letterSpacing: 0.6,
      fontFamily: font);

  TextStyle get baseHint => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: ColorsApp.instance.blackMedium.withOpacity(0.88),
      fontFamily: font);

  TextStyle get linkHome => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorsApp.instance.linkColor,
      fontFamily: font);

  TextStyle get infoError => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorsApp.instance.blackNormal.withOpacity(0.65),
      fontFamily: font);

  TextStyle get basePrice => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: ColorsApp.instance.corPrimaria,
      fontFamily: font);

  TextStyle get basePriceSingle => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 27,
      fontStyle: FontStyle.normal,
      color: ColorsApp.instance.priceSingle,
      fontFamily: font);

  TextStyle get baseRating => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: ColorsApp.instance.blackNormal.withOpacity(0.65),
      fontFamily: font);
}
