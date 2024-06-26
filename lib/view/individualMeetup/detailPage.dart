// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:share_plus/share_plus.dart';
//
// class Description extends StatefulWidget {
//   const Description({super.key});
//
//   @override
//   State<Description> createState() => _DescriptionState();
// }
//
// class _DescriptionState extends State<Description> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();
//
//   final List<String> imagesData = [
//     "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//     "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//     "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//     "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//     "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//   ];
//
//   final Map<String, dynamic> data = {
//     "actorName": "Author",
//     "duration": "1,028",
//     "totalAverageFees": "9,999",
//     "about": "From cardiovascular health to fitness, flexibility, balance, "
//         "stress relief, better sleep, increased cognitive performance, "
//         "and more, you can reap all of these benefits in just one "
//         "session out on the waves. So, you may find yourself wondering "
//         "what are the benefits of going on a surf camp.",
//     "save": "1034",
//     "like": "1034",
//     "rating": "3.4",
//     "popularPeopleImgs": [
//       "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//       "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//       "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//       "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
//       "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg"
//     ]
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Description",
//           style: TextStyle(
//               color: HexColor("#072e43"), fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // _buildImageCarousel(height, width),
//             SizedBox(height: height * 0.02),
//             // _buildStatsRow(height, width),
//             SizedBox(height: height * 0.02),
//             _buildActorDetails(height),
//             SizedBox(height: 8),
//             _buildInfoRow(Icons.access_time, 'Duration 20 Mins', height),
//             SizedBox(height: 8),
//             _buildInfoRow(Icons.wallet, 'Total Average Fees ₹9,999', height),
//             SizedBox(height: 16),
//             _buildAboutSection(height),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildImageCarousel(double height, double width) {
//     return Center(
//       child: Container(
//         height: height * 0.455,
//         width: width * 0.85,
//         decoration: BoxDecoration(
//             color: HexColor("#e0e0e0"),
//             borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           children: [
//             Container(
//               height: height * 0.4,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(10)),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CarouselSlider.builder(
//                     itemCount: imagesData.length,
//                     carouselController: _controller,
//                     options: CarouselOptions(
//                       height: height * 0.45,
//                       viewportFraction: 1.0,
//                       scrollPhysics: const BouncingScrollPhysics(),
//                       enableInfiniteScroll: false,
//                       autoPlay: false,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           _current = index;
//                         });
//                       },
//                     ),
//                     itemBuilder: (context, index, realIndex) {
//                       return Container(
//                         width: width,
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                             image: NetworkImage(imagesData[index]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   Positioned(
//                     bottom: height * 0.01,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: imagesData.asMap().entries.map<Widget>((entry) {
//                         return GestureDetector(
//                           onTap: () => _controller.animateToPage(entry.key),
//                           child: Container(
//                             width: width * 0.025,
//                             height: height * 0.025,
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: width * 0.007),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: (Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? Colors.white
//                                       : Colors.white30)
//                                   .withOpacity(
//                                       _current == entry.key ? 0.9 : 0.4),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _buildIconRow(height),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconRow(double height) {
//     return Padding(
//       padding: EdgeInsets.only(top: height * 0.015),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildIconButton("assets/icons/download.png", "Download", height),
//           _buildIconButton("assets/icons/save.png", "Save", height),
//           _buildIconButton("assets/icons/heart.png", "Heart", height),
//           _buildIconButton("assets/icons/fullscreen.png", "Fullscreen", height),
//           _buildIconButton("assets/icons/share.png", "Share", height,
//               onTap: () {
//             Share.share('Check out this awesome surf camp!');
//           }),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildIconButton(String assetPath, String label, double height,
//       {VoidCallback? onTap}) {
//     return GestureDetector(
//       onTap: onTap ?? () => print(label.toLowerCase()),
//       child: Image.asset(
//         assetPath,
//         color: Colors.black,
//         height: height * 0.026,
//       ),
//     );
//   }
//
//   Widget _buildStatsRow(double height, double width) {
//     return Row(
//       children: [
//         _buildStatIconText("assets/icons/save.png", "1034", height, width),
//         _buildStatIconText("assets/icons/heart.png", "1034", height, width),
//         Container(
//           padding: EdgeInsets.symmetric(
//               horizontal: width * 0.03, vertical: width * 0.005),
//           decoration: BoxDecoration(
//               color: HexColor("#e0e0e0"),
//               borderRadius: BorderRadius.circular(10)),
//           child: Row(
//             children: List.generate(
//               5,
//               (index) => Icon(
//                 Icons.star,
//                 color: index < 3
//                     ? HexColor("#33dae2")
//                     : index == 3
//                         ? HexColor("#33dae2").withOpacity(0.4)
//                         : Colors.white,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: width * 0.02),
//         Text('3.2',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: height * 0.02,
//                 color: HexColor("#1873a2"))),
//       ],
//     );
//   }
//
//   Widget _buildStatIconText(
//       String assetPath, String text, double height, double width) {
//     return Row(
//       children: [
//         Image.asset(
//           assetPath,
//           color: HexColor("#1873a2"),
//           height: height * 0.02,
//         ),
//         SizedBox(width: width * 0.01),
//         Text(text,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: height * 0.02)),
//         SizedBox(width: width * 0.03),
//       ],
//     );
//   }
//
//   Widget _buildActorDetails(double height) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Actor Name',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: HexColor("#072e43"),
//               fontSize: height * 0.023),
//         ),
//         SizedBox(height: height * 0.01),
//         Text('Indian Actress',
//             style: TextStyle(color: Colors.black45, fontSize: height * 0.02)),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String text, double height) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.black45),
//         SizedBox(width: 4),
//         Text(text,
//             style: TextStyle(color: Colors.black45, fontSize: height * 0.02)),
//       ],
//     );
//   }
//
//   Widget _buildAboutSection(double height) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: HexColor("#072e43"),
//               fontSize: height * 0.023),
//         ),
//         Text(
//           'From cardiovascular health to fitness, flexibility, balance, '
//           'stress relief, better sleep, increased cognitive performance, '
//           'and more, you can reap all of these benefits in just one '
//           'session out on the waves. So, you may find yourself wondering '
//           'what are the benefits of going on a surf camp.',
//           style: TextStyle(color: Colors.black45, fontSize: height * 0.02),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text("See More", style: TextStyle(color: HexColor("#072e43"))),
//         )
//       ],
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final Map<String, dynamic> data = {
    "actorName": "Author",
    "duration": "1,028",
    "totalAverageFees": "9,999",
    "about": "From cardiovascular health to fitness, flexibility, balance, "
        "stress relief, better sleep, increased cognitive performance, "
        "and more, you can reap all of these benefits in just one "
        "session out on the waves. So, you may find yourself wondering "
        "what are the benefits of going on a surf camp.",
    "save": "1034",
    "like": "1034",
    "rating": "3.4",
    "popularPeopleImgs": [
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg"
    ]
  };

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          "Description",
          style: TextStyle(
              color: HexColor("#072e43"), fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customImageCarousel(
                height: height,
                width: width,
                imagesData: data['popularPeopleImgs']),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: customStatsRow(height: height, width: width),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: customActorDetails(height: height),
            ),
            SizedBox(height: height * 0.018),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: customInfoRow(
                  icon: Icons.access_time,
                  text: 'Duration ${data['duration']} Mins',
                  height: height),
            ),
            SizedBox(height: height * 0.018),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: customInfoRow(
                  icon: Icons.wallet,
                  text: 'Total Average Fees ₹${data['totalAverageFees']}',
                  height: height),
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: customAboutSection(height: height),
            ),
            SizedBox(height: height * 0.07),
          ],
        ),
      ),
    );
  }

  Widget customImageCarousel({height, width, imagesData}) {
    return Center(
      child: Container(
        height: height * 0.455,
        width: width * 0.88,
        decoration: BoxDecoration(
            color: HexColor("#e0e0e0"),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider.builder(
                    itemCount: imagesData.length,
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: height * 0.45,
                      viewportFraction: 1.0,
                      scrollPhysics: const BouncingScrollPhysics(),
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imagesData[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: height * 0.01,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: imagesData.asMap().entries.map<Widget>((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: width * 0.025,
                            height: height * 0.025,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: width * 0.007),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.white30)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            customIconRow(height: height),
          ],
        ),
      ),
    );
  }

  Widget customIconRow({height}) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customIconButton(
              assetPath: "assets/icons/download.png",
              label: "Download",
              height: height),
          customIconButton(
              assetPath: "assets/icons/save.png",
              label: "Save",
              height: height),
          customIconButton(
              assetPath: "assets/icons/heart.png",
              label: "Heart",
              height: height),
          customIconButton(
              assetPath: "assets/icons/fullscreen.png",
              label: "Fullscreen",
              height: height),
          customIconButton(
              assetPath: "assets/icons/share.png",
              label: "Share",
              height: height,
              onTap: () {
                Share.share('Check out this awesome surf camp!');
              }),
        ],
      ),
    );
  }

  Widget customIconButton({assetPath, label, height, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => print(label.toLowerCase()),
      child: Image.asset(
        assetPath,
        color: Colors.black,
        height: height * 0.026,
      ),
    );
  }

  Widget customStatsRow({height, width}) {
    return Row(
      children: [
        customStatIconText(
            "assets/icons/save.png", data['save'].toString(), height, width),
        customStatIconText(
            "assets/icons/heart.png", data['like'].toString(), height, width),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: width * 0.005),
          decoration: BoxDecoration(
              color: HexColor("#e0e0e0"),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: List.generate(
              5,
              (index) => Icon(
                size: height * 0.02,
                Icons.star,
                color: index < int.parse(data['rating'][0])
                    ? HexColor("#33dae2")
                    : index == int.parse(data['rating'][0])
                        ? HexColor("#33dae2").withOpacity(0.4)
                        : Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: width * 0.02),
        Text(data['rating'],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height * 0.02,
                color: HexColor("#1873a2"))),
      ],
    );
  }

  Widget customStatIconText(
      String assetPath, String text, double height, double width) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          color: HexColor("#1873a2"),
          height: height * 0.02,
        ),
        SizedBox(width: width * 0.01),
        Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: height * 0.02)),
        SizedBox(width: width * 0.03),
      ],
    );
  }

  Widget customActorDetails({height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['actorName'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor("#072e43"),
              fontSize: height * 0.023),
        ),
        SizedBox(height: height * 0.01),
        Text('Indian Actress',
            style: TextStyle(color: Colors.black45, fontSize: height * 0.02)),
      ],
    );
  }

  Widget customInfoRow({icon, text, height}) {
    return Row(
      children: [
        Icon(icon, color: Colors.black45),
        SizedBox(width: height * 0.01),
        Text(text,
            style: TextStyle(color: Colors.black45, fontSize: height * 0.02)),
      ],
    );
  }

  Widget customAboutSection({height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor("#072e43"),
              fontSize: height * 0.023),
        ),
        Text(
          data['about'],
          style: TextStyle(color: Colors.black45, fontSize: height * 0.02),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {},
            child:
                Text("See More", style: TextStyle(color: HexColor("#072e43"))),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
