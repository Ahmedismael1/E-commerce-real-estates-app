import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/Login/states.dart';
import 'package:two2/models/login_model.dart';
import 'package:two2/shared/dio.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  LoginModel loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);
  void getData({String email, String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: "login",
      data: {'email': email, 'password': password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error: error.toString()));
    });
  }

  bool isVisibility = true;

  void visiblePassword() {
    isVisibility = !isVisibility;

    emit(LoginVisibilityState());
  }
}
