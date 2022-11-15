import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget InputBar(
    {textColor,
      mainColor,
      hintText,
      focusColor=Colors.cyan,
      controller,
      isPassword,
      isValied}) {
  int mxl = 1;
  return TextFormField(

    maxLines: mxl,
    controller: controller,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      icon: Icon(Icons.add),
      errorText: isValied ? 'Bu kutucuk boş bırakılamaz' : null,
      errorStyle: TextStyle(fontSize: 0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusColor, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // iç kesim
      filled: true,
      fillColor: mainColor,
      // kullanıc bilgisi
      hintText: hintText,
      hintStyle: TextStyle(
        color: textColor,
      ),
    ),
    style: TextStyle(
      color: textColor,
      fontSize: 14,
    ),
    obscureText: isPassword,
    enableSuggestions: false,
    autocorrect: false,
    // obscureText: true,
    // obscuringCharacter: "*",
  );
}


Widget InputBarPars(
    {
      hintText,
      controller,
      isPassword,
      isNumber,
      isValied}) {
  int mxl = 1;
  return TextFormField(

    inputFormatters:  <TextInputFormatter>[

      isNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter
    ],
    maxLines: mxl,
    controller: controller,
    keyboardType: isNumber ? TextInputType.number : TextInputType.multiline,
    decoration: InputDecoration(
      // icon: Icon(Icons.add),
      errorText: isValied ? 'Bu kutucuk boş bırakılamaz' : null,
      errorStyle: TextStyle(fontSize: 0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // iç kesim
      filled: true,
      // kullanıc bilgisi
      hintText: hintText,
      hintStyle: TextStyle(
      ),
    ),
    style: TextStyle(
      fontSize: 14,
    ),
    obscureText: isPassword,
    enableSuggestions: false,
    autocorrect: false,
    // obscureText: true,
    // obscuringCharacter: "*",
  );
}

// keyboardType