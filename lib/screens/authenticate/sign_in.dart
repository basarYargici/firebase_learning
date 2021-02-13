import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:firebase_learning_app/screens/authenticate/sign_up.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:firebase_learning_app/services/auth.dart';
import 'package:firebase_learning_app/widgets/lottie_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

import 'authenticate.dart';

class SignIn extends StatefulWidget {
  static String routeName = '/sign_in_screen';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  UserModel signProcess;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _mailController = TextEditingController();
    final _passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //just go to the authenticate screen
            Navigator.pushReplacementNamed(context, Authenticate.routeName);
          },
        ),
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(shrinkWrap: true, children: [
          Padding(
            padding: EdgeInsets.all(
              Constants.maxPadding,
            ),
            child: Column(
              children: [
                LottieWidget(
                  path: 'cute-panda.json',
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: StringConstants.MAIL_DECORATION_LABEL,
                              hintText: StringConstants.MAIL_DECORATION_HINT,
                            ),
                            controller: _mailController,
                            validator: (value) => _validate(value, 'Please enter your mail')),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.05,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: StringConstants.PASSWORD_DECORATION_LABEL,
                              hintText: StringConstants.PASSWORD_DECORATION_HINT,
                            ),
                            controller: _passController,
                            obscureText: true,
                            validator: (value) => _validate(value, 'Please enter your password')),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.05,
                        ),
                        SignInButtonBuilder(
                          height: SizeConfig.screenHeight * 0.08,
                          icon: Icons.verified_user,
                          backgroundColor: ColorConstants.BLUE_GREY,
                          text: StringConstants.SIGN_IN_MAIL,
                          fontSize: Constants.bigFontSize,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await _auth.signInMail(_mailController.text.trim(), _passController.text.trim());
                              await Navigator.pushReplacementNamed(context, Home.routeName);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't you have an account?"),
                            TextButton(
                                onPressed: () => Navigator.pushReplacementNamed(context, SignUp.routeName),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: ColorConstants.AMBER),
                                ))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String _validate(String value, String text) {
    return value.isEmpty ? text : null;
  }
}
