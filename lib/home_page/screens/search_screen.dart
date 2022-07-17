import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/constants/constants.dart';
import 'package:two2/home_page/blocs/home_page_cubit.dart';
import 'package:two2/home_page/models/search_model.dart';
import 'package:two2/home_page/states/home_page_states.dart';

import 'details_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return (HomePageCubit.get(context).searchModel != null)
              ? Scaffold(
            appBar: AppBar(title: Text('Search'),centerTitle: true,),
              body: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => getAllFavourite(
                        HomePageCubit.get(context).searchModel.data[index],
                        context,
                        index),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: HomePageCubit.get(context)
                        .getAllFavouriteModel
                        .data
                        .length),
              )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget getAllFavourite(SearchData data, context, index) => Card(
        elevation: 5,
        child: Container(
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                  featuredProjectsImage,
                ),
                height: 140,
                width: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.attach_money_rounded),
                        Text("${data.price}/month",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("Type: ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(data.type,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),                    SizedBox(height: 5,),

                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${data.city}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'area:',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('${data.area}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.bedroom_parent_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${data.room}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.bathtub_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${data.bathroom}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400))
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        print(HomePageCubit.get(context)
                            .homeModel
                            .data
                            .properties[index]
                            .id);
                        print(HomePageCubit.get(context)
                            .searchModel.data[index].id);
                        HomePageCubit.get(context).getPropertyDetails(
                            id: HomePageCubit.get(context)
                                .searchModel.data[index].id);


                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertyDetails()));
                      },
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.60, 30),
                          //MediaQuery.of(context).size.width*0.25
                          backgroundColor: Colors.deepOrange),
                    )
                  ],
                ),
              )
            ],
          ),
          height: 140,
        ),
      );
}
