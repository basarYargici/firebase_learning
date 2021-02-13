import 'package:firebase_learning_app/screens/authenticate/authenticate.dart';
import 'package:firebase_learning_app/screens/authenticate/sign_in.dart';
import 'package:firebase_learning_app/screens/authenticate/sign_up.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:firebase_learning_app/screens/wrapper.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  // Sign.routeName: (context) => Sign(),
  Wrapper.routeName: (context) => Wrapper(),
  Home.routeName: (context) => Home(),
  Authenticate.routeName: (context) => Authenticate(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
};
