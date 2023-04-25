import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewsDetailScreen.dart';
import 'package:women_safety_final_project/widget/announcementDetailScreen.dart';

class AnnouncementWidget extends StatefulWidget {
  @override
  _AnnouncementWidgetState createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('announcement').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CarouselSlider.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final DocumentSnapshot<Object?> announcement =
                  snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => announecementDetailScreen(
                        Atitle: announcement['Atitle'],
                        Acontent: announcement['Acontent'],
                        AimageUrl: announcement['AimageUrl'],
                        Apublish_date: announcement['Apublish_date'],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200.0,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(announcement['AimageUrl']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              announcement['Atitle'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              announcement['Acontent'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}

//
// class announcementWidget extends StatefulWidget {
//   @override
//   _announcementWidget createState() => _announcementWidget();
// }
//
// class _announcementWidget extends State<announcementWidget> {
//   get announcement => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(80.0),
//         boxShadow: [
//           //
//         ],
//       ),
//       child: StreamBuilder(
//         stream:
//             FirebaseFirestore.instance.collection('announcement').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }
//           return ListView.builder(
//             itemCount: snapshot.data?.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot news =
//                   snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => announecementDetailScreen(
//                         Atitle: announcement['Atilte'],
//                         Acontent: announcement['Acontent'],
//                         AimageUrl: announcement['AimageUrl'],
//                         Apublish_date: announcement['Apublish_date'],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(16.0),
//                   padding: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           height: 200.0,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.0),
//                             image: DecorationImage(
//                               image: NetworkImage(news['AimageUrl']),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 16.0),
//                       Expanded(
//                         flex: 3,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               news['Atitle'],
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16.0,
//                               ),
//                             ),
//                             SizedBox(height: 8.0),
//                             Text(
//                               news['Acontent'],
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// //
