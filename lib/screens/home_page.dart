import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/widget/NewsWidget.dart';

import '../widget/MyCarousel.dart';
import '../widget/StackedColumnChartWidget.dart';
import '../widget/announcementWidget.dart';
import '../widget/get_lat_long_address.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Announcement",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.3, // set the height of the widget as needed
              child: AnnouncementWidget(), // add your widget here
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "News",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: height * 0.5,
              child: NewsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

//NewsWidget();
