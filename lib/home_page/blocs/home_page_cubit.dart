import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/constants/constants.dart';
import 'package:two2/home_page/models/buy_rent_model.dart';
import 'package:two2/home_page/models/details_model.dart';
import 'package:two2/home_page/models/favourite_model.dart';
import 'package:two2/home_page/models/getall_favorites.dart';
import 'package:two2/home_page/models/search_model.dart';
import 'package:two2/home_page/states/home_page_states.dart';
import 'package:two2/home_page/screens/favourite_screen.dart';
import 'package:two2/home_page/models/home_model.dart';
import 'package:two2/home_page/screens/home_screen.dart';
import 'package:two2/home_page/screens/search_screen.dart';
import 'package:two2/shared/dio.dart';

class HomePageCubit extends Cubit<HomeStates> {
  HomePageCubit() : super(HomeInitialState());

  static HomePageCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    HomeScreen(),
    SearchScreen(),
    FavouriteScreen(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(HomeNavBarState());
  }


  Map<int, bool> myFavorite = {};
  HomeModel homeModel;

  void getHomeData() {
    DioHelper.getData(
      url: "home",
    ).then((value) {

      homeModel = HomeModel.fromJson(value.data);
      homeModel.data.properties.forEach((element) {
        myFavorite.addAll({element.id: element.isFavourites});
      });
      print('1111111');
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState(error: error.toString()));
    });
  }
SearchModel searchModel;
  void getAllSearch(){
    DioHelper.postData(
      url: 'get-progerties-by-type',
      data: {
        'type': 'rent'
      },
    ).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      print('2222222222');
      emit(GetSearchSuccessState());
    }).
    catchError((error){});
emit(GetSearchErrorState());
  }

 void getTypeSearch(String type){
emit(GetSearchLoadingState());
    DioHelper.postData(
      url: 'get-progerties-by-type',
      data: {
        'type': type
      }
    ).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      print('333333333333');
      emit(GetSearchSuccessState());
    }).
    catchError((error){});
emit(GetSearchErrorState());
  }

  FavoriteModel favoriteModel;
 bool isLike=false;
  void favorite(int property_id) {
    isLike=!isLike;
    myFavorite[property_id] = !myFavorite[property_id];
    DioHelper.postData(
    //         url: 'favourites', data: {'property_id': property_id}, token: token
      )
        .then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      print('44444444444');

      emit(FavoriteSuccessState());
    });
  }
  GetAllFavouriteModel getAllFavouriteModel;


  void getAllFavourite() {
    isLike=!isLike;
emit(GetFavoriteLoadingState());
    DioHelper.getData(
      url: 'favourites',
      token: token
    ).then((value) {
      getAllFavouriteModel = GetAllFavouriteModel.fromJson(value.data);
     print("TOKEN " + token);
     print('');
      emit(GetFavoriteSuccessState());
    }).catchError((error) {
      print("Error " + error.toString());
      emit(GetFavoriteErrorState());
    });
  }


  int propertyDetailsNum;
  PropertyDetailsModel propertyDetailsModel;
  void   getPropertyDetails({int id}){

    emit(GetPropertyDetailsLoadingState());

    DioHelper.getData(
      url: 'properties/${id.toString()}'
    ).then((value) {
      propertyDetailsModel=PropertyDetailsModel.fromJson(value.data);
      print('7777777777');
      emit(GetPropertyDetailsSuccessState());

    })
        .catchError((error){
          print(error);
          emit(GetPropertyDetailsErrorState());
    });
  }
}
