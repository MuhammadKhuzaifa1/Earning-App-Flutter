import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/App_Dialogs.dart';
import '../components/Container_dashboard.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';
import '../constants/App_style/Appimage.dart';
import '../controller/MobileAds_controller.dart';
import '../model/container_model.dart';
import 'login_screen.dart';


class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({Key? key}) : super(key: key);

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {

  String username = "";
  bool Loading = false;


  int counter3 = 0;

  Future refres() async {
    setState(() {
      getvalue();
    });
  }

  Map<String, String>? mudata;

  getvalue() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      username = sp.getString("name").toString();
      counter3 = sp.getInt("2")!;
    });
  }

  bool _isRewardedAdLoaded = false;


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    getConnectivity();
    getadata();
    MobileAdsController().loadInterstitialAd();
    FlutterNativeSplash.remove();
    getvalue();
    Future.delayed(Duration(seconds: 2)).then((value) => refres());
    super.initState();
  }
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;


  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return App_Dialogs.exit_app_dialog(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.blue2,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          child: mudata != null
              ? mudata!["status"] == "enable" ? AdWidget(
            ad: MobileAdsController().getBannnerAd(mudata!["adId"].toString())
              ..load(),
          ) : Container(child: Center(child: Text("Ad not available"),),)
              : Container(child: Center(child: Text("Ad Loading..."),),),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: RefreshIndicator(
              onRefresh: refres,
              displacement: 80,
              edgeOffset: 20,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                    child: SingleChildScrollView(
                      child: Card(color: AppColors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          AppImage.PersonIcon),),
                                    title: Text(username.toUpperCase(),
                                      style: AppTextStyle.normalText(
                                          fontSize: 20,
                                          colors: AppColors.white,
                                          fontweight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,),
                                    subtitle: InkWell(
                                      onTap: () async {
                                        App_Dialogs.app_logout(
                                            context, () async {
                                          final sp = await SharedPreferences
                                              .getInstance();
                                          Get.off(login_screen());
                                          setState(() {
                                            sp.remove("name");
                                            sp.remove("2");
                                          });
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text("${"Logout"}",
                                            style: AppTextStyle.normalText(
                                                colors: AppColors.white,
                                                fontweight: FontWeight.bold),),
                                          SizedBox(width: 3,),
                                          Icon(
                                            Icons.logout, color: Colors.white,
                                            size: 17,),
                                        ],
                                      ),
                                    )
                                ),
                              ), SizedBox(height: 5,),
                              Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColors.blue2),
                                child: Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("Your Balance",
                                            style: AppTextStyle.normalText(
                                                colors: AppColors.white),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Text("\$${counter3}",
                                        style: AppTextStyle.normalText(
                                            fontSize: 30,
                                            colors: AppColors.white,
                                            fontweight: FontWeight.bold),),
                                    ),
                                  ],),
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ), SizedBox(height: 20,),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.8,
                    child: RefreshIndicator(
                      onRefresh: refres,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: container_list.containerlists.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 15, mainAxisSpacing: 15),
                        itemBuilder: (context, index) {
                          return Container_dashboard(
                            imagepath: container_list.containerlists[index]
                                .images,
                            name: container_list.containerlists[index].name,
                            onpress: container_list.containerlists[index]
                                .onpress,
                            subtitle: container_list.containerlists[index]
                                .subtitle,
                          );
                        },),
                    ),
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }

  getadata() async {
    QuerySnapshot addata = await FirebaseFirestore.instance.collection(
        "BannerAd").get();
    var data = addata.docs;
    print(data[0]["Status"].toString());
    print(data[0]["BannerAdId"].toString());
    setState(() {
      mudata = {
        "adId": data[0]["BannerAdId"].toString(),
        "status": data[0]["Status"].toString(),
      };
    });
  }
  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Row(mainAxisAlignment:   MainAxisAlignment.center,
        children: [
          const Text('No Connection'),SizedBox(width: 3,),
          Icon(Icons.wifi_off,color: Colors.red,),
        ],
      ),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
