import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authenticate/sign-screen/sign_in.dart';


class Wrapper extends StatelessWidget {
  static String routeName = '/wrapper_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sign(),
    );
  }
}
