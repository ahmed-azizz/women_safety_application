import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/widget/NewsWidget.dart';

import '../widget/MyCarousel.dart';
import '../widget/StackedColumnChartWidget.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "     Announcement",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 160, // set the height of the widget as needed
              child: MyCarousel(), // add your widget here
            ),
            SizedBox(
              height: 29,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "     News",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 29,
            ),
            Expanded(
              child: NewsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

//NewsWidget();
