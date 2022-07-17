import 'package:flutter/material.dart';
import 'package:two2/constants/constants.dart';

class TermsAndCondition extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms and Condition'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [ Text(termsAndCondition+termsAndCondition
            ,style: TextStyle(fontWeight: FontWeight.w600
                ,fontSize: 18
            ),),],
        ),
      ),
    );
  }
}
