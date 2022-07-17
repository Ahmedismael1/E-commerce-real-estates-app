
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/home_page/screens/favourite_screen.dart';
import 'package:two2/home_page/screens/home_screen.dart';
import 'package:two2/home_page/screens/search_screen.dart';
import 'package:two2/test/testdio.dart';
import 'package:two2/test/teststate.dart';

import 'catgoryModel.dart';
import 'homeTest.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens=[
    HomeScreen(),
    SearchScreen(),
    FavouriteScreen(),



  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  Map<int, bool> favorites = {};


  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: 'categories',
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }}
