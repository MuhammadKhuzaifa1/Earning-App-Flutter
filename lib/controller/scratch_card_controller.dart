import 'package:flutter/material.dart';

class ScratchCardController extends ChangeNotifier{

  bool scratchCard = true;

  setValue(bool value){
    scratchCard = value;
    notifyListeners();
  }


}