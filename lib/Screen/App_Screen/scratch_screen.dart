import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:scratcher/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/Custom_appbar.dart';
import '../../constants/App_style/AppColors.dart';
import '../../constants/App_style/AppTextStyle.dart';
import '../../constants/App_style/Appimage.dart';
import '../../constants/Sessions.dart';
import '../../controller/MobileAds_controller.dart';
import '../../controller/scratch_card_controller.dart';
import '../dashboard_screen.dart';


class scratch_screen extends StatefulWidget {
  const scratch_screen({Key? key}) : super(key: key);

  @override
  State<scratch_screen> createState() => _scratch_screenState();
}

class _scratch_screenState extends State<scratch_screen> {

  List<int> items = [
    1 ,
    1 ,
    1 ,
    1 ,
    1 ,
    1 ,

  ];

  int cunter3 = 0;

  getvalue()async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      cunter3 = sp.getInt("2")!;
      SessionControler().Coin = cunter3.toString();
    });
  }

  final Scratcherkey = GlobalKey<ScratcherState>();
  bool playing = false;
  final Controller = ConfettiController();
  @override
  void initState() {
    MobileAdsController().loadInterstitialAd();
    getvalue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,
      children: [
      Scaffold(backgroundColor: AppColors.blue2,
        appBar: CustomAppBar.appBar(name: "Scratch Card",onPressed: () {
        Get.off(Dashboard_Screen());},),
        body:
      SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Card(color: AppColors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Scratch Card Earn",style: AppTextStyle.normalText(colors: Colors.white,fontweight: FontWeight.w500,fontSize: 23),),
                )),
            SizedBox(height: 20,),
            Center(
              child: Stack(alignment: Alignment.center,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          items.shuffle();
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Scratcher(
                              brushSize: 30,
                              threshold: 50,
                              color: Colors.transparent,
                              accuracy: ScratchAccuracy.high,
                              enabled:  Provider.of<ScratchCardController>(context).scratchCard,
                              image: Image.asset(AppImage.scratchcard,fit: BoxFit.fill,),
                              onThreshold: ()async{
                                Provider.of<ScratchCardController>(context,listen: false).setValue(false);
                                Controller.play();
                                final sp = await SharedPreferences.getInstance();
                                setState(() {
                                  sp.setInt("2", cunter3+1);
                                });
                                Future.delayed(Duration(seconds: 3)).then((value) => Controller.stop());
                             Future.delayed(Duration(seconds: 3)).then((value) =>   Get.off(Dashboard_Screen()));
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.pink,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child: Text("\$${items[index].toString()}",style: AppTextStyle.normalText().copyWith(color: AppColors.whiteColor
                                      ,fontWeight: FontWeight.bold,fontSize: 24),),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],),
            ),
            Card(child: Image.asset(AppImage.scratchgif,fit: BoxFit.cover,),),
          ],),
      ),),

    ConfettiWidget(confettiController:Controller,
    blastDirection: 5,
    shouldLoop: true,
    emissionFrequency: 0.1,
    blastDirectionality: BlastDirectionality.explosive,

    ),
    ],
    );
  }
}
