import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> imagesData = [
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
      "https://cff2.earth.com/uploads/2019/08/29132238/Does-working-from-home-actually-help-the-environment-and-improve-traffic-flow.jpg",
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Discription"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.45,
                  decoration: BoxDecoration(color: HexColor("#e0e0e0")),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.4,

                        child: Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: imagesData.length,
                              options: CarouselOptions(
                                height: height * 0.45,
                                viewportFraction: 1.05,scrollPhysics: const BouncingScrollPhysics(),
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
                                      image: NetworkImage(imagesData[index]),
                                      fit: BoxFit.cover,
                                      opacity: 0.6,
                                    ),
                                  ),

                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [     Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1034', style: TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Share.share('Check out this awesome surf camp!');
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star_half, color: Colors.amber),
                    Icon(Icons.star_border),
                    Text('3.2', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Actor Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Indian Actress'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 4),
                    Text('Duration 20 Mins'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 4),
                    Text('Total Average Fees ₹9,999'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'From cardiovascular health to fitness, flexibility, balance, '
                  'stress relief, better sleep, increased cognitive performance, '
                  'and more, you can reap all of these benefits in just one '
                  'session out on the waves. So, you may find yourself wondering '
                  'what are the benefits of going on a surf camp.',
                ),
              ],
            ),
          ),
        ));
  }
}

class SurfCampScreen extends StatelessWidget {
  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1034', style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // Share.share('Check out this awesome surf camp!');
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star_half, color: Colors.amber),
              Icon(Icons.star_border),
              Text('3.2', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Actor Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Indian Actress'),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 4),
              Text('Duration 20 Mins'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.attach_money),
              SizedBox(width: 4),
              Text('Total Average Fees ₹9,999'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'From cardiovascular health to fitness, flexibility, balance, '
            'stress relief, better sleep, increased cognitive performance, '
            'and more, you can reap all of these benefits in just one '
            'session out on the waves. So, you may find yourself wondering '
            'what are the benefits of going on a surf camp.',
          ),
        ],
      ),
    );
  }
}
