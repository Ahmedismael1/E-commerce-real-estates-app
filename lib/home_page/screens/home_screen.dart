import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/Login/login_layout.dart';
import 'package:two2/constants/constants.dart';
import 'package:two2/home_page/blocs/home_page_cubit.dart';
import 'package:two2/home_page/models/home_model.dart';
import 'package:two2/home_page/screens/about_us.dart';
import 'package:two2/home_page/screens/buy_screen.dart';
import 'package:two2/home_page/screens/details_screen.dart';
import 'package:two2/home_page/screens/rent_screen.dart';
import 'package:two2/home_page/screens/terms_conditions.dart';
import 'package:two2/home_page/states/home_page_states.dart';
import 'package:two2/shared/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   var cubit = HomePageCubit.get(context);
    return BlocConsumer<HomePageCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return (HomePageCubit.get(context).homeModel != null)
            ? Scaffold(drawer:
        Drawer(child: Container(color: Colors.white,
              child: Column(children: [
           SizedBox(height: 29,),
                Container(
                  color: Colors.deepOrange
                  ,
                  child: ListTile(
                    title:  Center(child: Text('Setting',style: TextStyle(color: Colors.white,fontSize: 25),)),
                    onTap: () {
                      print('11111111');
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.white38,
                    child: ListTile(
                      title:  Text('About us'),trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                      leading: Icon(Icons.info),
                      onTap: () {

Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.white38,
                    child: ListTile(
                      title:  Text('Terms & Conditions'),trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                      leading: Icon(Icons.receipt_long ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndCondition()));                        // Update the state of the app.
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: ExpansionTile(leading: Icon(Icons.recommend_outlined),collapsedTextColor: Colors.black,textColor: Colors.black,iconColor: Colors.black,
                    title: Text('Join our community', style:
                    TextStyle(fontSize: 15, )),children: [
                      Row(children:  [
                        IconButton(padding: EdgeInsets.all(0),
                            icon: Icon(Icons.facebook,color: Colors.blue, size: 40,)),
                        CircleAvatar(backgroundImage: NetworkImage('$instagram'),radius: 19,),SizedBox(width: 7,),
                        CircleAvatar(backgroundImage: NetworkImage('$tiktok',),radius: 19,),

                      ],)

                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.white38,
                    child: ListTile(
                      title:  Text('Logout'),
                      leading: Icon(Icons.logout  ),
                      onTap: () {


                        CashHelper.removeData(
                          key: 'token'
                          ).then((value)
                          {
                            if (value)
                            {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => LoginPage()));

                            }
                          });
                                              // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                ),
              ],),
            ),),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Home Berry"),centerTitle: true,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search))
            ],
          ),
              body: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 12),
                        child: Text('Quick Search', style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                        InkWell(
                        onTap:()async{
                          HomePageCubit.get(context).getTypeSearch('buy');
                        await  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyScreen()));
                        },

                          child: Card(
                            elevation: 3,
                            child:
                          Container(
                            width: MediaQuery.of(context).size.width*0.25,height: 60,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(5)
                            ),),
                            child:
                          Center(
                            child: Text('Buy',style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),),
                          )
                            ,),),
                        ) ,SizedBox(width: 10,),
                        InkWell(
                          onTap: ()async{
                            HomePageCubit.get(context).getTypeSearch('rent');
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RentScreen()));
                          },
                          child: Card(
                            elevation: 3,
                            child:
                          Container(
                            width: MediaQuery.of(context).size.width*0.25,height: 60,

                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(5)
                            ),),
                            child:
                          Center(
                            child: Text('Rent',style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),),
                          )
                            ,),),
                        ) ,SizedBox(width: 10,),
                        Card(
                          elevation: 3,
                          child:
                        Container(
                          width: MediaQuery.of(context).size.width*0.25,height: 60,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(5)
                          ),),
                          child:
                        Center(
                          child: Text('Citys',style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),),
                        )
                          ,),) ,
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 12,
                        ),
                        child: Text(
                          "Featured Projects", style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(10))),
                        height: 233,
                        child: ListView.separated(
                          physics:  BouncingScrollPhysics(),

                          itemBuilder: (context, index) => featuredProjects(
                              HomePageCubit.get(context)
                                  .homeModel
                                  .data
                                  .projects[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount: HomePageCubit.get(context)
                              .homeModel
                              .data
                              .projects
                              .length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 12,
                        ),
                        child: Text(
                          "Featured Cities", style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        height: 265,
                        child: ListView.separated(          physics:  BouncingScrollPhysics(),

                            itemBuilder: (context, index) => featuredCities(
                                HomePageCubit.get(context)
                                    .homeModel
                                    .data
                                    .cities[index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: HomePageCubit.get(context)
                                .homeModel
                                .data
                                .cities
                                .length,
                            scrollDirection: Axis.horizontal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 12,
                        ),
                        child: Text(
                          "Featured Apartment", style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        height: 280,
                        child: ListView.separated(
                            physics:  BouncingScrollPhysics(),

                            itemBuilder: (context,index)=>featuredApartment(
                            HomePageCubit.get(context).homeModel.data.properties[index],context,index),
                            separatorBuilder: (context,index)=> SizedBox(width: 10,),scrollDirection: Axis.horizontal,
                            itemCount: HomePageCubit.get(context).homeModel.data.properties.length),

                      ),
                    ],
                  ),
                ),
            )
            : Center(
                child: CircularProgressIndicator(),
              );

      },
    );
  }

  Widget featuredProjects(Projects project) => Padding(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        child: Card(color: Colors.white,
          elevation: 3,
          child: Column(
            children: [
              Stack(
                //  alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: 170,width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
                        ,image: DecorationImage(image: NetworkImage("${featuredProjectsImage}"),

                      fit: BoxFit.cover,)),
                    // child: Image(
                    //   image: NetworkImage("${featuredProjectsImage}"),
                    //   height: 170,
                    //   width: 250,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.verified_user),
                            Text(
                              'Verified',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white.withOpacity(0.4),
                ),
                width: 250,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${project.name}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "City:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${project.city}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget featuredCities(Cities cities) => Padding(
        padding: const EdgeInsets.only(left: 12, top: 20),
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Container(
                height: 170,width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
                    ,image: DecorationImage(image: NetworkImage("${featuredCitiesImage}"),

                  fit: BoxFit.cover,)),

              ),
              // Image(
              //   image: NetworkImage(
              //     featuredCitiesImage,
              //   ),
              //   width: 258,
              //   height: 180,
              //   fit: BoxFit.cover,
              // ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cities.governorate.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cities.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                width: 250,
                height: 45,
              )
            ],
          ),
        ),
      );

  Widget featuredApartment(Properties properties, context,index) => Padding(
    padding: const EdgeInsets.only(left: 12,top: 20),
    child: Card(
      elevation: 3,
      child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
                        ,image: DecorationImage(image: NetworkImage("${featuredApartmentImage}"),

                      fit: BoxFit.cover,)),),

                  // ),
                  // Image(
                  //   image: NetworkImage(featuredApartmentImage),
                  //   height: 180,
                  //   width: 250,
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.verified_user,
                                size: 20,
                              ),
                              Text(
                                'Verified',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                              ),
                              Text(
                                properties.views.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 12,
                      left: 12,
                      child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                properties.area.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'm',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 6,
                      right: 6,
                      child: Container(
                          child: IconButton(
                            onPressed: (){

                              //HomePageCubit.get(context).favorite(properties.id);
                             // HomePageCubit.get(context).favorite(properties.id);
                              HomePageCubit.get(context).getAllFavourite();

                              print( HomePageCubit.get(context).isLike);
                              print(HomePageCubit.get(context).homeModel.data.properties[index].id);
                            },
                              icon: Icon(
                                Icons.favorite,
                                color:  (HomePageCubit.get(context).isLike)?Colors.red:Colors.white,
                                size: 30,
                              )


                          ))),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            properties.city,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                properties.price.toString(),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.attach_money_rounded)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'name:',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            properties.name.toString(),
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                width: 250,
                height: 65,
              )
            ],
          ),
    ),
  );
}
