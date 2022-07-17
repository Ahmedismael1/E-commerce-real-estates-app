import 'package:two2/home_page/models/home_model.dart';

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeNavBarState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSuccessState extends HomeStates{

}
class HomeErrorState extends HomeStates{
  final String error;
  HomeErrorState({this.error});
}
class FavoriteSuccessState extends HomeStates{}
class GetFavoriteSuccessState extends HomeStates{}
class GetFavoriteLoadingState extends HomeStates{}
class GetFavoriteErrorState extends HomeStates{}
class GetPropertyDetailsSuccessState extends HomeStates{}
class GetPropertyDetailsLoadingState extends HomeStates{}
class GetPropertyDetailsErrorState extends HomeStates{}
class GetSearchSuccessState extends HomeStates{}
class GetSearchLoadingState extends HomeStates{}
class GetSearchErrorState extends HomeStates{}
class IsLikeState extends HomeStates{}
class PropertyDetailsNumState extends HomeStates{}
