import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';


class login_button extends StatefulWidget {
  VoidCallback? onTape;
  String ? name;
   login_button({this.onTape,this.name});

  @override
  State<login_button> createState() => _login_buttonState();
}

class _login_buttonState extends State<login_button> {
  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onTape,
      child: Container(width: 193,height: 44,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.pink),
          child:  Center(
            child:Text(widget.name.toString(),style:
            AppTextStyle.normalText(colors: Colors.white,fontweight: FontWeight.w500,fontSize: 18),),
          )),);

  }
}
