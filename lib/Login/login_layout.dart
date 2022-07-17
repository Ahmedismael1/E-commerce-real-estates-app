import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:two2/Login/bloc.dart';
import 'package:two2/Login/states.dart';
import 'package:two2/constants/constants.dart';
import 'package:two2/home_page/blocs/home_page_cubit.dart';
import 'package:two2/home_page/home_screens/home_page_layout.dart';
import 'package:two2/models/login_model.dart';
import 'package:two2/shared/reusables.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two2/shared/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  String address, password;
  LoginModel loginModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state)
        {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == 1) {
              CashHelper.saveData(
                      value: state.loginModel.data.accessToken, key: 'token')
                  .then((value) {
                    token=state.loginModel.data.accessToken;
                    HomePageCubit.get(context).getAllFavourite();

                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()));
              });
              print(state.loginModel.message);
            } else if (state.loginModel.status == 0) {
              Fluttertoast.showToast(
                  msg: "your Email or Password is Wrong ",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print(state.loginModel.message);
              //Fluttertoast.showToast(msg: state.loginModel.message);
            } else {
              Fluttertoast.showToast(
                  msg: "something becomes error",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Colors.deepOrangeAccent,
              title: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ReusableTextFiled(
                        onChange: (val) {
                          address = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email address must not be empty";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(address)) {
                            return "Email is not valid ";
                          }

                          return null;
                        },
                        hintText: "Example@example.com",
                        labelText: "Email",
                        textController: emailController,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          password = val;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: "password",
                            hintText: "********",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.lock),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                LoginCubit.get(context).visiblePassword();
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                            )),
                        obscureText: LoginCubit.get(context).isVisibility,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Must Not be Empty";
                          } else if (value.length < 8) {
                            return "Password Length Short";
                          }
                          // else if(!RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$.').hasMatch(password)){
                          //   return "password must have special character ";
                          // }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => TextButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              LoginCubit.get(context).getData(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              fixedSize: Size(MediaQuery.of(context).size.width, 60)),
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () async {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                        child: Text(
                          "Forget password",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Creat a new account",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
