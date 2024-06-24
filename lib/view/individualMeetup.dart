import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IndividualMeetup extends StatefulWidget {
  const IndividualMeetup({Key? key}) : super(key: key);

  @override
  _IndividualMeetupState createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 1.0), // Add 1.0 for the line height
        child: AppBar(
          automaticallyImplyLeading: true,
          leading: Icon(Icons.arrow_back_ios_rounded),
          title: Text(
            "Individual Meetup",
            style: TextStyle(color: HexColor("#072e43")),
          ),

        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1.0, // Height of the line
            color: Colors.grey[300], // Color of the line
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                 children: [Container(height: 200,color:Colors.red,),Container(height: 200,color:Colors.redAccent,),Container(height: 200,color:Colors.blue,),Container(height: 200,color:Colors.yellowAccent,)],
              ),
            )
          ),
        ],
      ),
    );
  }
}


