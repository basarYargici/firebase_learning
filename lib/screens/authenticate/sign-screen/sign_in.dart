import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:firebase_learning_app/services/auth.dart';
import 'package:firebase_learning_app/widgets/lottie_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Sign extends StatefulWidget {
  static String routeName = '/sign_screen';

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final AuthService _auth = AuthService();
  UserModel signProcess;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.4,
            child: LottieWidget(
              path: 'door.json',
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          SignInButtonBuilder(
            height: SizeConfig.screenHeight * 0.08,
            icon: Icons.verified_user,
            backgroundColor: ColorConstants.BLUE_GREY,
            text: StringConstants.SIGN_IN_MAIL,
            fontSize: Constants.bigFontSize,
            onPressed: () async {
              //signProcess = await _auth.signInMail('deneme@gmail.com', 'abc1234');
              signProcess == null ? print('error') : print(signProcess.toString());
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          SignInButtonBuilder(
            height: SizeConfig.screenHeight * 0.08,
            icon: Icons.verified_user,
            backgroundColor: ColorConstants.GREEN,
            text: StringConstants.SIGN_UP_MAIL,
            fontSize: Constants.bigFontSize,
            onPressed: () async {
              signProcess = await _auth.signInAnon();
              signProcess == null ? print('error') : print(signProcess.email);
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          SignInButtonBuilder(
            height: SizeConfig.screenHeight * 0.08,
            icon: Icons.verified_user,
            backgroundColor: ColorConstants.RED,
            text: StringConstants.SIGN_IN_ANON,
            fontSize: Constants.bigFontSize,
            onPressed: () async {
              signProcess = await _auth.signInAnon();
              signProcess == null ? print('error') : print(signProcess.toString());
            },
          ),
        ],
      ),
    );
  }
}
