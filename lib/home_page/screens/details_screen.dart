import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:two2/constants/constants.dart';
import 'package:two2/home_page/blocs/home_page_cubit.dart';
import 'package:two2/home_page/models/details_model.dart';
import 'package:two2/home_page/models/home_model.dart';
import 'package:two2/home_page/states/home_page_states.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetails extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(centerTitle: true,
            title: Text('Details',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold )),

          ),
          body:
          (state is!GetPropertyDetailsLoadingState)
            ? SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child:
          buildDetails(context,  HomePageCubit.get(context).propertyDetailsModel.data),

        )
            : Center(
          child: CircularProgressIndicator(),
        )
        );
      },
    );

  }
}




Widget buildDetails(BuildContext context, DetailsData data) {
  return
    Column(
      children: [
        Image(
          image: NetworkImage(featuredApartmentImage),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Text(
                    'City:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    data.city,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Row(
                children: [
               Row(children: [
                 Icon(
                   Icons.location_on_outlined,
                   color: Colors.deepOrange,
                 ),
                 TextButton(
                     onPressed: () async{


                       Location location = new Location();

                       bool _serviceEnabled;
                       PermissionStatus _permissionGranted;
                       LocationData _locationData;

                       _serviceEnabled = await location.serviceEnabled();
                       if (!_serviceEnabled) {
                         _serviceEnabled = await location.requestService();
                         if (!_serviceEnabled) {
                           return;
                         }
                       }

                       _permissionGranted = await location.hasPermission();
                       if (_permissionGranted == PermissionStatus.denied) {
                         _permissionGranted = await location.requestPermission();
                         if (_permissionGranted != PermissionStatus.granted) {
                           return;
                         }
                       }

                       _locationData = await location.getLocation();
                       String lat, long;
                       //get my location =>
                       // lat = _locationData.latitude;
                       // long=_locationData.longitude;
                       lat =data.lat;
                       long =data.lng;
                       print("${lat}**********************");
                       print("${long}**********************");

                       String url='https://www.google.com/maps/search/?api=1&query=$lat,$long';
                       if(await canLaunch(url)){
                       launch(url);
                       }else{Fluttertoast.showToast(
                       msg: "Their is some Thing Error",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0);
                       }

                     },
                     child: Text(
                       'Get Location',
                       style: TextStyle(
                           fontSize: 20,
                           color: Colors.deepOrange,
                           fontWeight: FontWeight.bold),
                     )),
               ],),
                  SizedBox(width: 80,),
                  Row(children: [
                    Icon(Icons.attach_money_rounded),
                    Text("${data.price}/month",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],)
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'area:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('${data.area}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.bedroom_parent_outlined,
                  size: 25,),
                  SizedBox(
                    width: 9,
                  ),
                  Text('${data.room}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.bathtub_outlined),
                  SizedBox(
                    width:9,
                  ),
                  Text('${data.bathroom}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.local_parking),
                  SizedBox(
                    width: 9,
                  ),
                  Text('${data.park}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text('Description',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(
                height: 8,
              ),
              Text(data.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 18,
                  )), SizedBox(
                height: 8,
              ),
              Text('Nearby Services',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(
                height: 8,
              ),
              Text('-Mall of Arebia',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Text('-Alwatnia Gas Station',
                  style: TextStyle(fontSize: 18, )), SizedBox(
                height: 8,
              ),
              Card(

                elevation: 3,
                child: ExpansionTile(tilePadding: EdgeInsets.all(0),

                  title: Text('Owner Data', style:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  children: [
                    Row(children: [
                      Text('Name:  ',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),Text(data.owner.name,
                          style:
                          TextStyle(fontSize: 15, )),   ],),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text('Email:  ',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(data.owner.email,
                          style:
                          TextStyle(fontSize: 15, )),],),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text('Mobile:  ',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(data.owner.mobile,
                          style:
                          TextStyle(fontSize: 15, )),
                    ],),
                    SizedBox(
                      height: 10,
                    ),
                  ],backgroundColor: Colors.white54,
                 textColor: Colors.black,iconColor: Colors.black,

                ),
              ),
              Text('Amenities',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.door_sliding_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Balacony',
                            style:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.sports_rounded  ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Gymnastics ',
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.pool ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Pool',
                            style:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.air_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Air Condition',
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.lock),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Door Man',
                            style:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.local_parking),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Parking',
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),SizedBox(height: 10,),

            ],
          ),
        ),
      ],
    );

}
