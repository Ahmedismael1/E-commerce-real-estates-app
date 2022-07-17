import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:two2/Login/login_layout.dart';
import 'package:two2/shared/shared_preferences.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.title,
    @required this.image,
    @required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();
 void submit()
 {
   CashHelper.saveData(key:'onBoarding' ,value: true).then((value) {
     if(value){
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => LoginPage()));
     }
   });
 }
  List<BoardingModel> onBoardScreen = [
    BoardingModel(
      image: 'images/onBoarding.png',
      title: 'Search for your dream home',
      body: 'User will be able to search for this dream home ',
    ),
    BoardingModel(
      image: 'images/onBoarding.png',
      title: 'Buy or Rent House',
      body: 'Buy or rent your expect house from phone',
    ),
    BoardingModel(
      image: 'images/onBoarding.png',
      title: 'looking for comfort',
      body: 'The app Let you chose your house with confidence.',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          actions: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)
              )),
              child: TextButton(
                  onPressed: submit,
                  child: Text("skip",style: TextStyle(fontSize: 20,color: Colors.deepOrange),)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == onBoardScreen.length - 1) {
                      setState(() {
                        isLast = true;
                        print("aaaaaaaaaaaaaaaa");

                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(onBoardScreen[index]),
                  itemCount: onBoardScreen.length,
                  controller: boardController,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: onBoardScreen.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                  ),
                  Spacer(),
           Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.deepOrange)
             ,width: 110,
             child: TextButton(
               onPressed: () {
                 if (isLast) {
                   submit();
                 } else {
                   boardController.nextPage(
                       duration: Duration(milliseconds: 750),
                       curve: Curves.easeInCubic);
                 }
               },
               child: isLast ? Text("Get Start",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,),) :
             Text("Next",style: TextStyle(color: Colors.white,fontSize: 22),),
             ),
           )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 450,
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
