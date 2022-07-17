import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/home_page/blocs/home_page_cubit.dart';
import 'package:two2/home_page/states/home_page_states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

          body: HomePageCubit.get(context)
              .bottomScreens[HomePageCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              HomePageCubit.get(context).changeScreen(index);
              //HomePageCubit.get(context).getAllFavourite();

            },
            currentIndex: HomePageCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
            ],
          ),
        );
      },
    );
  }
}
