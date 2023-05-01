import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'Native_splash/SplashScreen.dart';
import 'controller/MobileAds_controller.dart';
import 'controller/provider_controller.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main()async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    MobileAdsController().AppopenAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersController,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Color.fromRGBO(119, 101, 254, 0.2)
        ),
        home: Splash_screen(),
      ),
    );
  }
}

