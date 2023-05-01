import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';

class AppButtons extends StatefulWidget {
  String? name;
  VoidCallback onPress;
   AppButtons({this.name,required this.onPress});

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onPress,
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(child: Text(widget.name.toString(),style:   AppTextStyle.normalText(colors: Colors.white,fontweight: FontWeight.w500,fontSize: 20),),),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.blue,),
      ),
    );
  }
}
