import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Drawer/DrawerScreen.dart';
import '../Screen/App_Screen/ad_screen.dart';
import '../Screen/App_Screen/scratch_screen.dart';
import '../Screen/App_Screen/spinner_screen.dart';
import '../Screen/App_Screen/wallet_screen.dart';
import '../Screen/App_Screen/withdraw_screen.dart';
import '../constants/App_style/Appimage.dart';

class container_model{
  final String? name;
  final String? subtitle;
  final VoidCallback? onpress;
  final String? images;

  container_model({this.name,this.images,this.onpress,this.subtitle});
}

class container_list{
  static var containerlists = [

    container_model(subtitle: "Unlimited Dollars",
        name: "Ad Earn",
        onpress: () {
     Get.to(ads_screen());
    },images: AppImage.AdsIcon),

    container_model(name: "Spinner Earn ",subtitle: "Free Spinner",
        onpress: () {
      Get.to(spinner_screen());
    },images: AppImage.SpinnerIcon),

    container_model(name: "Scrach Earn",subtitle: "Daily Scrach ",
      images: AppImage.ScrachIcon,onpress: () {
      Get.to(scratch_screen());
    },),

    container_model(images: AppImage.WalletIcon,subtitle: "Wallet Check",
      name: "Balance View",onpress: () {
      Get.to(wallet_screen());
    },),

    container_model( images: AppImage.WithDraw,name: "Withdraw",subtitle: "Transfer Withdraw",
      onpress: () {
      Get.to(withdraw_screen());
    },),
    container_model(images: AppImage.PravicyIcon,name: "Privacy",subtitle: "Privacy Police",
      onpress: () {
      Get.to(DrawerScreen());
    },),
  ];
}