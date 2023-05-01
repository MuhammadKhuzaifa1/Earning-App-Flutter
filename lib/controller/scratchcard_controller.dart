import 'package:flutter/material.dart';

class PrivacyController extends ChangeNotifier{

  bool checkValue = false;

  bool get value => checkValue;

  setValue(bool value){
    checkValue = value;
    notifyListeners();
  }

}