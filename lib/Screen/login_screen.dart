import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/App_Dialogs.dart';
import '../components/Text_Field.dart';
import '../components/login_button.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';
import '../constants/App_style/Appimage.dart';
import 'dashboard_screen.dart';


class login_screen extends StatefulWidget {
  login_screen({this.name});
   String? name;
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

String?  username;
  bool loading2 = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return App_Dialogs.exit_app_dialog(context);
      },
      child: Scaffold(resizeToAvoidBottomInset: false,
        appBar: AppBar(leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(height: 70,width: 70,child:
              CircleAvatar(backgroundColor: Colors.white,
                  child: Image.asset(AppImage.appicon)),),
          ),
        backgroundColor: AppColors.pink,
        toolbarHeight: 130,
        title: Center(child: Text("Online Earning",style:
        AppTextStyle.normalText(fontweight: FontWeight.bold,colors: Colors.white,fontSize: 30),)),),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: key,
            child: Column(
              children: [
               Expanded(child: Column(children: [ SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [CircleAvatar(
                       backgroundColor: AppColors.grey.withOpacity(0.2),
                       child: Icon(Icons.person)),SizedBox(width: 7,),
                     Text("ENTER YOUR DETAILS:"),
                   ],),
                 SizedBox(height: 30,),

                 Text_Field(obscureTexts: false,
                   lable: "Enter Name",controller: namecontroller,onValidator:(value) {
                   if(value == null || value.isEmpty){
                     return "Enter Name";
                   }
                   return null;
                 }, ),
                 SizedBox(height: 10,),

                 Text_Field(obscureTexts: true,
                   lable: "Enter Password",controller: passwordcontroller,onValidator:(value) {
                   if(value == null || value.isEmpty){
                       return "Enter Password";
                   }
                   return null;
                 }, ),
                 SizedBox(height: 30,),

                 login_button(name: "Login",onTape: ()async {
                   if(key.currentState!.validate()){
                     final sp = await SharedPreferences.getInstance();
                     setState(() {
                       sp.setString("name", namecontroller.text.toString());
                       sp.setString("password", namecontroller.text.toString());
                       sp.get("name");
                       Get.off(Dashboard_Screen());
                     });

                   }
                 },),
                ],
               ),),
                Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(subtitle: Text("Make money & earn cash with Mode Earn App."),
                    title: Text("Online Earning"),
                  )
                )),





            ],),
          ),
        ),
      ),
    );
  }
}
