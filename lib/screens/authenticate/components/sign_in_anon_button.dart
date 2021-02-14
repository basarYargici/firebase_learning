import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

class SignAnonButton extends StatelessWidget {
  const SignAnonButton({
    Key key,
    @required AuthService auth,
  })  : _auth = auth,
        super(key: key);

  final AuthService _auth;

  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      height: SizeConfig.screenHeight * 0.08,
      icon: Icons.verified_user,
      backgroundColor: ColorConstants.RED,
      text: StringConstants.SIGN_IN_ANON,
      fontSize: Constants.bigFontSize,
      onPressed: () async {
        UserModel signProcess = await _auth.signInAnon(context);
        signProcess == null ? print('Error occurred') : Navigator.pushNamed(context, Home.routeName);
      },
    );
  }
}
