import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/Custom_appbar.dart';
import '../../components/dollars_ads.dart';
import '../../constants/App_style/AppColors.dart';
import '../../constants/App_style/AppTextStyle.dart';
import '../../constants/Sessions.dart';
import '../../controller/MobileAds_controller.dart';
import '../dashboard_screen.dart';

class ads_screen extends StatefulWidget {
  const ads_screen({Key? key}) : super(key: key);

  @override
  State<ads_screen> createState() => _ads_screenState();
}

class _ads_screenState extends State<ads_screen> {
int counter = 0;
int? count;
int cunter3 = 0;

List<String> items = [
  '0.11 ',
  '0.23 ',
  '0.47 ',
  '0.58 ',
  '0.70 ',
  '0.86 ',
  '0.93 ',
  '0.99',
];

  getvalue()async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      count = sp.getInt("1");
      cunter3 = sp.getInt("2")!;
      SessionControler().Coin = cunter3.toString();
    });
  }

  @override
  void initState() {
    MobileAdsController().loadInterstitialAd();
    // FacebookAudienceNetwork.init(
    //   testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
    // );
    getvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar:CustomAppBar.appBar(name: "Watch Ads",onPressed: () {
        Get.off(Dashboard_Screen());
      },),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(color: AppColors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Watch Ads",style: AppTextStyle.normalText(fontSize: 30,fontweight: FontWeight.bold,colors: Colors.white),),
                )),
            SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(itemCount: items.length,
              itemBuilder: (context, index) {
              final item = items[index];
             return dollars_ads(dollars: item,onPress: ()async {
               MobileAdsController().showInterstitialAd();
               final sp = await SharedPreferences.getInstance();
              setState(() {
                sp.setInt("2",cunter3+1);
                print("1234567890-=0000000000000000000000");
                print(SessionControler().Coin);
              });
               Future.delayed(Duration(seconds: 3)).then((value) =>   Get.off(Dashboard_Screen()));
             },);
            },),
          ),
        ],),
      ),
    );
  }
}
