import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/widget/help_button.dart';

import '../widget/NewsWidget.dart';
import '../widget/get_lat_long_address.dart';

class help_screen extends StatelessWidget {
  const help_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                    "When you are in trouble or harassment or any attacks by anyone press the button, your location will appear by police and they will get to you as soon as possible  ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center)),
            SizedBox(
              height: 30,
            ),
            Text("Or you can contact us or visit :",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 50,
            ),
            Text(
                "بەڕێوەبەرایەتى بەرەنگاربوونەوەی توندوتیژى دژی ئافرەتان هەولێر:07507598172 - 0662567272 ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(
              "پۆلیس:    104(066)  ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                "بەڕێوەبەرایەتى بەرەنگاربوونەوەی توندوتیژى دژی ئافرەتان سلێمانی:07708156719 - 0533293015   ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(
              "پۆلیس:   3148 319(053)   ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                "بەڕێوەبەرایەتى بەرەنگاربوونەوەی توندوتیژى دژی ئافرەتان دهۆک:07507851881-0664561315  ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(
              "ئاسايش:  123   ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
