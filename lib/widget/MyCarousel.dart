import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  List<String> _images = [
    'https://scontent.febl5-1.fna.fbcdn.net/v/t1.6435-9/56825545_1070159993173524_6985978299394555904_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=AaeUCDgwP6kAX8KbmLJ&_nc_ht=scontent.febl5-1.fna&oh=00_AfDjecBuYZHUwsVoF4jV3RJppC6qD5aWrsQ0AEMdVs7vXg&oe=646E4524',
    'https://anfsorani.com/uploads/ckb/articles/2019/09/20190922-20190922-20181119-stop-aux-violences-contre-les-femmesb87806-image-jpgd8ee54-image-jpg09dee7-image.jpg',
    'https://kurdistantv.net/content/upload/1/archive/2018-08/570b993913df1.jpg',
    'https://gdb.voanews.com/4A8B443C-5A4F-46FC-95C0-CF4E426BBBC5_w1023_r1_s.jpg',
    'https://www.wishe.net/imgnews3/3172017103800_25-06-16-97214994.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _images.map((image) {
        return Container(
          width: 600,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(image, fit: BoxFit.cover),
          ),
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
