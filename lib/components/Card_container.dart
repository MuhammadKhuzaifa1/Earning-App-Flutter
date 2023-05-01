import 'package:flutter/material.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';

class Card_container extends StatefulWidget {
  String? title,subtitle;
   Card_container({this.title,this.subtitle});

  @override
  State<Card_container> createState() => _Card_containerState();
}

class _Card_containerState extends State<Card_container> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.pink,
      child: ListTile(title: Text(widget.title.toString(),style: AppTextStyle.normalText(colors: AppColors.white),),trailing:
      Text(widget.subtitle.toString(),style:AppTextStyle.normalText(fontSize: 27,fontweight: FontWeight.w500,colors: AppColors.white),),),
    );
  }
}
