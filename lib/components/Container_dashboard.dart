import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';

class Container_dashboard extends StatefulWidget {
  final String? name,subtitle;
  final VoidCallback? onpress;
  final String? imagepath;
   Container_dashboard({Key? key, this.name, this.onpress, this.imagepath, this.subtitle});

  @override
  State<Container_dashboard> createState() => _Container_dashboardState();
}

class _Container_dashboardState extends State<Container_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(

        color: AppColors.blue,
        borderRadius: BorderRadius.circular(15),
        ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: widget.onpress,
        child: Container(
          height: 150,
          width: double.infinity,
          child: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 100,width: 100,
              child: Image.asset(widget.imagepath.toString())),
              SizedBox(height: 10,),
              Text(widget.name.toString(),style: AppTextStyle.normalText(colors: AppColors.white),),
              SizedBox(height: 4,),
              Text(widget.subtitle.toString(),style: AppTextStyle.normalText(colors: AppColors.white),)
          ],),),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
        ),
      ),
    );
  }
}
