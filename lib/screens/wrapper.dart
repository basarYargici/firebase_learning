import 'package:firebase_learning_app/models/user.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/sign-screen/sign_in.dart';

class Wrapper extends StatelessWidget {
  static String routeName = '/wrapper_screen';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);
    return Scaffold(
      body: user == null ? Sign() : Home(),
    );
  }
}
