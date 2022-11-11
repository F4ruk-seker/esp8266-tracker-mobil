import 'package:flutter/material.dart';
class AppColor {
  late Color backgorund;//Skobeloff
  late Color success; // Viridian Green
  late Color info; //Robin Egg Blue
  late Color light;
  late Color danger; //Magic Potion
  late Color warning;
}

AppColor getTheme({Auto = true,darklight = false}){
  if (Auto){
    final now = DateTime.now();
    if (now.hour > 22 || now.hour < 8 ){
      print('akşam');
    }else{
      print('savah');
    }
  }else{
    print('auto is disable');
  }
  return AppColor();
}

void main(){
  getTheme();
}