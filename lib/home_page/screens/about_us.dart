import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About us'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Compass is building the first modern real "
            "estate platform, pairing the industry’s top talent with technology "
            "to make the search and sell experience intelligent and seamless.",style: TextStyle(fontWeight: FontWeight.w600
        ,fontSize: 18
        ),),
      ),
    );
  }
}
