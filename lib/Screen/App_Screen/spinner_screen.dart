import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/AppButton.dart';
import '../../components/Custom_appbar.dart';
import '../../constants/App_style/AppColors.dart';
import '../../constants/App_style/AppTextStyle.dart';
import '../../constants/App_style/Appimage.dart';
import '../../constants/Sessions.dart';
import '../../controller/MobileAds_controller.dart';
import '../dashboard_screen.dart';




class spinner_screen extends StatefulWidget {
  const spinner_screen({Key? key}) : super(key: key);

  @override
  State<spinner_screen> createState() => _spinner_screenState();
}

class _spinner_screenState extends State<spinner_screen> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  List<int> items = [
    10 ,
    20 ,
    40 ,
    50 ,
    70 ,
    80 ,
    90 ,
    100 ,
  ];
  int cunter3 = 0;
  getvalue()async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      cunter3 = sp.getInt("2")!;
      SessionControler().Coin = cunter3.toString();
    });
  }
@override
  void initState() {
  MobileAdsController().loadInterstitialAd();
    getvalue();
    super.initState();
  }
  int count =0;
  String sms ="";

  bool playing = false;
  final Controller = ConfettiController();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,
      children: [
        Scaffold(backgroundColor: AppColors.blue2,
          appBar: CustomAppBar.appBar(name: "Spinner Earn",onPressed: () {
          Get.off(Dashboard_Screen());

        },),
          body: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(child: Image.asset(AppImage.spinnergif,fit: BoxFit.cover,),),
                    SizedBox(height: 10,),
                    Card(color: AppColors.pink,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Spin to Earn",style: AppTextStyle.normalText(colors: Colors.white,fontweight: FontWeight.w500,fontSize: 23),),
                        )),
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        child: FortuneWheel(
                          animateFirst: false,
                          onAnimationEnd: ()async{
                            final sp =  await  SharedPreferences.getInstance();
                            setState(() {
                              Controller.play();
                              Future.delayed(Duration(seconds: 3)).then((value) => Controller.stop());
                              sms = "Congratulation";
                              sp.setInt("2",cunter3+1);
                              Future.delayed(Duration(seconds: 3)).then((value) =>   Get.off(Dashboard_Screen()));
                            });
                          },
                          selected: selected.stream,
                          items: [
                            for (int i = 0; i < items.length; i++)...<FortuneItem>{
                              FortuneItem(child: Text(items[i].toString()))},

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    AppButtons(name:"Spin",onPress: () {
                      MobileAdsController().showInterstitialAd();
                      setState(() {
                        selected.add(Fortune.randomInt(0, items.length));});
                    },),

                  ],
                ),
              ),
            ),

        ],),
          ),),
        ConfettiWidget(confettiController:Controller,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.1,

        ),
      ],
    );
  }
}
