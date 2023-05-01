import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/AppButton.dart';
import '../../components/Card_container.dart';
import '../../components/Custom_appbar.dart';
import '../../components/ReusbaleRow_bank.dart';
import '../../constants/App_style/AppColors.dart';
import '../../constants/App_style/AppTextStyle.dart';
import '../../constants/App_style/Appimage.dart';
import '../dashboard_screen.dart';

class withdraw_screen extends StatefulWidget {
  const withdraw_screen({Key? key}) : super(key: key);

  @override
  State<withdraw_screen> createState() => _withdraw_screenState();
}

class _withdraw_screenState extends State<withdraw_screen> {
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
    return  Scaffold(

      appBar: CustomAppBar.appBar(name: "Withdraw",onPressed: () {
        Get.off(Dashboard_Screen());
      },),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 250,width: double.infinity,
                  child: Image.asset(AppImage.withdrawgif,fit: BoxFit.cover,)),
              Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(subtitle: Text("Details of your total amount"),
                    title: Text("Total Balance"),
                    trailing:  Text("\$${totaldollars}",style: AppTextStyle.normalText(fontSize: 40,fontweight: FontWeight.bold,colors: Colors.black87),),
                  )
              )),
              SizedBox(height: 10,),
              ReusbaleRow(title:"Transfer Your Bank",subtitle: totaldollars.toString(),imagepath: AppImage.BankIcon),
              SizedBox(height: 10,),
              ReusbaleRow(title:"Transfer Your Playpal",subtitle: totaldollars.toString(),imagepath: AppImage.Paypal),
              SizedBox(height: 10,),
              ReusbaleRow(title:"Transfer Your Other Wallet",subtitle: totaldollars.toString(),imagepath: AppImage.OtherIcon),
              SizedBox(height: 10,),
              AppButtons(name: "Back",
                onPress: () {
                  Get.to(Dashboard_Screen());

                },),
              Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(subtitle: Text("You can easily withdraw from this app whether you have a PayPal or bank account or with other wallet. App you can withdraw less than (\$500) dollars and you will receive it after 24 hours."),
                    title: Text("Withdraw Detail"),
                  )
              )),

          ],),
        ),
      ),
    );
  }
}
