import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25;
const double _cardBorderRadius = 10;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius =>_cardBorderRadius;

class UIParameters{
  static BorderRadius get cardBorderRadius =>BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>const EdgeInsets.all(_mobileScreenPadding);

  // static bool isDarkMode(BuildContext context){
  //   return Theme.of(context).brightness == Brightness.dark;
  // }
  static bool isDarkMode(){
    return Get.isDarkMode?true:false;
    // return Theme.of(context).brightness==Brightness.dark;

  }
}