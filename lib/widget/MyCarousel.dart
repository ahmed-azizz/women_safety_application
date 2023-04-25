import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:women_safety_final_project/widget/announcementWidget.dart';

import 'announcementWidget.dart';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  List<Widget> _announcement = [AnnouncementWidget()];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _announcement.map((Widget widget) {
        return Container(
          width: 650,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: widget,
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
