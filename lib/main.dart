import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/Login/login_layout.dart';
import 'package:two2/home_page/home_screens/home_page_layout.dart';
import 'package:two2/home_page/states/home_page_states.dart';
import 'package:two2/onbording/onbording.dart';
import 'package:two2/shared/dio.dart';
import 'package:two2/shared/shared_preferences.dart';

import 'constants/bloc_observer.dart';
import 'constants/constants.dart';
import 'home_page/blocs/home_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      HomePageCubit();
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  await CashHelper.init();
  Widget widget;
  token = CashHelper.getData(key: 'token');
  //print(token);
  bool onBoarding = CashHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else {
      widget = LoginPage();
    }
  } else {
    widget = OnBoarding();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomePageCubit()
              ..getHomeData()
              ..getAllFavourite()
              ..getAllSearch())
      ],
      child: BlocConsumer<HomePageCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.deepOrange),
            home: startWidget,
          );
        },
      ),
    );
  }
}
