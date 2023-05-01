import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/App_style/AppTextStyle.dart';

class dollars_ads extends StatefulWidget {
final  String? dollars;
final VoidCallback? onPress;
  const dollars_ads({required this.dollars, required this.onPress});

  @override
  State<dollars_ads> createState() => _dollars_adsState();
}


class _dollars_adsState extends State<dollars_ads> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: widget.onPress,
        child: Card(
          child: Container(height: 60,width: double.infinity,
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Watch Ads",style: AppTextStyle.normalText(fontweight: FontWeight.w500),),
                SizedBox(width: 10,),
                Text("\$${widget.dollars}",style: AppTextStyle.normalText(fontweight: FontWeight.bold,fontSize: 25),),
              ],
            ),
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),),
        ),
      ),
    );
  }
}
