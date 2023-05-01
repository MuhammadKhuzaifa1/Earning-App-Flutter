
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/dashboard_screen.dart';
import '../Screen/login_screen.dart';

class SplashController{
  static String key = "name";
  Future<void> checkUserController()async{

    SharedPreferences shrf = await SharedPreferences.getInstance();
    String? value  = shrf.getString(key);

    if(value.isNull) {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(login_screen()) );
    }else{
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(Dashboard_Screen()) );
    }

  }

}