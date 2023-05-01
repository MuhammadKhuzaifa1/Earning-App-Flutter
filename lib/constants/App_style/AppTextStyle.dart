import 'package:flutter/material.dart';

class AppTextStyle{

  static  TextStyle normalText({double  fontSize = 14,Color? colors = Colors.black,FontWeight fontweight
  = FontWeight.normal,FontStyle? fontstyle}) =>
      TextStyle(fontSize: fontSize,color: colors,fontWeight: fontweight,fontStyle: fontstyle);
}