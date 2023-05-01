import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/App_style/AppTextStyle.dart';
import 'App_Dialogs.dart';



class ReusbaleRow extends StatefulWidget {
  String? title,subtitle,imagepath;
   ReusbaleRow({this.title,this.subtitle,this.imagepath});

  @override
  State<ReusbaleRow> createState() => _ReusbaleRowState();
}

class _ReusbaleRowState extends State<ReusbaleRow> {
  int totaldollars = 0;

  getvalue()async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      totaldollars =  sp.getInt("2")!;
    });}
  @override
  void initState() {
    getvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: () {
      if(totaldollars >= 500){
        App_Dialogs.Congratulation_dialog(context);
      }else{
       App_Dialogs.withdraw_dialog(context) ;}
    },
      leading: Image.asset(widget.imagepath.toString(),),trailing: Card(color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Withdraw",style: AppTextStyle.normalText(fontweight: FontWeight.bold,colors: Colors.white,fontSize: 15),),
        )),
      title: Text(widget.title.toString(),style: AppTextStyle.normalText(),),
      subtitle: Text("Your Balance  \$${widget.subtitle}",style: AppTextStyle.normalText(),),);
  }
}
