import 'package:flutter/material.dart';
import '../constants/App_style/AppColors.dart';
import '../constants/App_style/AppTextStyle.dart';


class CustomAppBar{

  static AppBar appBar({VoidCallback? onPressed,String? name}){
    return AppBar(backgroundColor: AppColors.pink,
        automaticallyImplyLeading: false,
        title: Text(name.toString(),style: AppTextStyle.normalText(fontSize: 20,
            colors: Colors.white)),
        leading: Row(
          children: [
            SizedBox(width: 10),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.all(5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

}
