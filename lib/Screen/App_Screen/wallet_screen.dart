import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/Card_container.dart';
import '../../components/Custom_appbar.dart';
import '../../constants/App_style/AppColors.dart';
import '../../constants/App_style/AppTextStyle.dart';
import '../../constants/App_style/Appimage.dart';
import '../../controller/MobileAds_controller.dart';
import '../dashboard_screen.dart';

class wallet_screen extends StatefulWidget {
  const wallet_screen({Key? key}) : super(key: key);

  @override
  State<wallet_screen> createState() => _wallet_screenState();
}

class _wallet_screenState extends State<wallet_screen> {

  int totaldollars = 0;
  Banner? banner;

  Widget bannerad = Container(height: 55,width: double.infinity,);

  getvalue()async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      totaldollars =  sp.getInt("2")!;
    });}
  @override
  void initState() {
    MobileAdsController().loadInterstitialAd();
    Future.delayed(Duration(milliseconds: 100)).then((value) => MobileAdsController().showInterstitialAd());
   getvalue();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(name: "Wallet Earn",onPressed: () {
      Get.off(Dashboard_Screen());

    },),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(subtitle: Text("Details of your total amount"),
                    title: Text("Total Balance"),
                    trailing:  Text("\$${totaldollars}",style: AppTextStyle.normalText(fontSize: 40,fontweight: FontWeight.bold,colors: Colors.black87),),
                  )
              )),
                SizedBox(height: 20,),

              Card_container(title: "Balance",subtitle:"\$${totaldollars}" ),
              Card_container(title: "Withdraw",subtitle:"\$0"),

              Card_container(title: "Invite Friend",subtitle:"\$0"),
              Card_container(title: "Totals",subtitle:"\$${totaldollars}"),

              SizedBox(height: 20,),
              Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(subtitle: Text("You can easily withdraw from this app whether you have a PayPal or bank account or easypaisa jazzcash"),
                    title: Text("Withdraw Detail"),
                  )
              )),

              Card(child: Image.asset(AppImage.walletgif,fit: BoxFit.cover,),)

          ],),
        ),
      ),
    );
  }
}