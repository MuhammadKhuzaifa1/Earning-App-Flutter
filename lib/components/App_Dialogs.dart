import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';

class App_Dialogs {

  static Future<bool> exit_app_dialog(BuildContext context)async {
    bool? exitapp = await  showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Column(children: [
          Text("Are you sure?"),

        ],),content: Text("Do you want to exit from the app?"),
        actions: [
          CupertinoDialogAction(child: Text("EXIT",style: AppTextStyle.normalText(colors: AppColors.blue2),),onPressed: (){
            // Navigator.of(context).pop(true);
            SystemNavigator.pop();
          }),
          CupertinoDialogAction(child: Text("CANCEL",style: AppTextStyle.normalText(colors: AppColors.alertColor)),onPressed: (){Navigator.of(context).pop(false);}),
        ],
      ),); return exitapp??  false;
  }

  static void withdraw_dialog(BuildContext context) {
    showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Withdraw Transfer"),SizedBox(width: 4,),
              Icon(Icons.error_outline,color: Colors.red,),
            ],
          ),
        ],),content: Text("You can withdraw only \$500 dollars. \ Please earn more dollars your balance is insufficient."),
        actions: [
          CupertinoDialogAction(child: Text("OK"),onPressed: (){Navigator.of(context).pop();}),
          CupertinoDialogAction(child: Text("CANCEL"),onPressed: (){Navigator.of(context).pop();}),
        ],
      ),);
  }

  static void Congratulation_dialog(BuildContext context) {
    showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Congratulations"),SizedBox(width: 4,),
              Icon(Icons.done,color: Colors.green,),
            ],
          ),

        ],),content: Text("Hi, Dear User! Thanks for using the app. As, it is clearly "
          "mentioned in the description that it is a prank app so, you can "
          "share this app with your friends/family members to PRANK them!"),
        actions: [
          CupertinoDialogAction(child: Text("OK"),onPressed: (){Navigator.of(context).pop();}),
          CupertinoDialogAction(child: Text("CANCEL"),onPressed: (){Navigator.of(context).pop();}),
        ],
      ),);
  }

  static void app_logout(BuildContext context,VoidCallback onPree) {
    showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LOGOUT"),
              Icon(Icons.logout,color: Colors.red,),
            ],
          ),

        ],),content: Text("Do you want to logout from the account?"),
        actions: [
          CupertinoDialogAction(child: Text("LOGOUT",style: AppTextStyle.normalText(colors: AppColors.blue2)),onPressed: onPree),
          CupertinoDialogAction(child: Text("CANCEL",style: AppTextStyle.normalText(colors: AppColors.alertColor)),onPressed: (){Navigator.of(context).pop();}),
        ],
      ),);
  }
}