import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:promilo_task/view/individualMeetup/detailPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndividualMeetup extends StatefulWidget {
  const IndividualMeetup({Key? key}) : super(key: key);

  @override
  _IndividualMeetupState createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Map<String, dynamic>> imgList = [
    {
      "imageUrl":
          "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "text": "Popular Meetups in India"
    },
    {
      "imageUrl":
          "https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "text": "Popular Meetups in Maharashtra"
    },
    {
      "imageUrl":
          "https://images.pexels.com/photos/192320/pexels-photo-192320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "text": "Popular Meetups in Kerala"
    },
  ];

  List<dynamic> imagesData = [
    "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
  ];
  final List<Map<String, String>> meetups = [
    {
      'image':
          "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    },
    {
      'image':
          "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    },
  ];

  Future<void> removeLoginData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    setState(() {
      sharedUser.remove('user');
      sharedUser.remove('authToken');
      Navigator.of(context).pushReplacementNamed("/");
    });

    print("LogOut");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                removeLoginData();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: Text(
            "Individual Meetup",
            style: TextStyle(
                color: HexColor("#072e43"), fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1.5,
            color: Colors.grey[300],
          ),
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: height * 0.025),
                customSearchBar(height: height, width: width),
                SizedBox(height: height * 0.03),
                customSlider(width: width, height: height, imgList: imgList),
                SizedBox(
                  height: height * 0.26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.06, bottom: width * 0.03),
                        child: Text(
                          "Trending Popular People",
                          style: TextStyle(
                              color: HexColor("#072e43"),
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: imagesData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: width * 0.06),
                              child: trendingPopularPeopleCard(
                                  height: height, width: width,index : index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  height: height * 0.26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.06, bottom: width * 0.03),
                        child: Text(
                          "Trending Popular People",
                          style: TextStyle(
                              color: HexColor("#072e43"),
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: imagesData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return topTrendingMeetupCard(
                                meetup: imagesData[index],
                                width: width,
                                height: height,
                                index: index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget customSearchBar({width, height}) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
      child: SizedBox(
        height: height * 0.06,
        child: SearchBar(
          leading: Image.asset(
            "assets/icons/search.png",
            height: height * 0.033,
            color: HexColor("#072e43"),
          ),
          trailing: [
            Image.asset(
              "assets/icons/mic.png",
              height: height * 0.033,
              color: HexColor("#072e43"),
            )
          ],
          hintText: "Search",
          hintStyle: WidgetStatePropertyAll(
              TextStyle(color: Colors.black54, fontSize: height * 0.019)),
          elevation: const WidgetStatePropertyAll(0),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: HexColor("#072e43"), width: 1.5))),
        ),
      ),
    );
  }

  Widget customSlider(
      {required double width,
      required double height,
      required List<dynamic> imgList}) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                height: height * 0.25,
                viewportFraction: 0.99,scrollPhysics: const BouncingScrollPhysics(),
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
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.055, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imgList[index]["imageUrl"]),
                      fit: BoxFit.cover,
                      opacity: 0.6,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, bottom: height * 0.02),
                      child: SizedBox(
                        width: width * 0.4,
                        child: Text(
                          imgList[index]["text"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map<Widget>((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.019,
                height: 12.0,
                margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: MediaQuery.of(context).size.width * 0.005),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black38)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget trendingPopularPeopleCard({width, height,index}) {

    return Container(
      height: height * 0.2,
      width: width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(right: width * 0.03),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.03, top: width * 0.03, bottom: width * 0.005),
            child: Row(
              children: [
                Container(
                  height: height * 0.05,
                  width: height * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: HexColor("#072e43"), width: 1.5),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/36/ef/67/36ef67988108c24e34fbffec9dcd6cb4.jpg"))),
                ),
                SizedBox(width: width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Author",
                      style: TextStyle(
                        color: HexColor("#072e43"),
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "1,028 Meetups",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: height * 0.015,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black45,
            endIndent: width * 0.025,
            indent: width * 0.025,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.03, top: width * 0.01, bottom: width * 0.005),
            child: SizedBox(
              height: height * 0.065,
              child: Stack(
                children: imagesData.asMap().entries.map((entry) {
                  int index = entry.key;
                  String image = entry.value;
                  return Positioned(
                    left: index * 40,
                    child: CircleAvatar(
                      radius: height * 0.032,
                      foregroundImage: NetworkImage(image),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.03, top: width * 0.01),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor("#064372"),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.03,
                      left: width * 0.03,
                      top: width * 0.01,
                      bottom: width * 0.01),
                  child: const Text(
                    "See more",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topTrendingMeetupCard({width, height, meetup, int index = 0}) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Description(),));},
      child: Container(
        width: width * 0.45,
        margin: EdgeInsets.only(left: width * 0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(meetup),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(
              "0${(index + 1).toString()}",
              style: TextStyle(
                  fontSize: height * 0.05,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
