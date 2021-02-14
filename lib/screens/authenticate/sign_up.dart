import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:firebase_learning_app/screens/authenticate/sign_in.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:firebase_learning_app/widgets/lottie_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authenticate.dart';
import 'components/sign_in_mail_button.dart';
import 'components/sign_up_mail_button.dart';

class SignUp extends StatefulWidget {
  static String routeName = '/sign_up_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          Constants.maxPadding,
        ),
        child: ListView(
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
                      validator: (value) => _validate(value, StringConstants.MAIL_VALIDATION_ERROR)),
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
                      validator: (value) => _validate(value, StringConstants.PASSWORD_VALIDATION_ERROR)),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  buildSignUpButton(formKey: _formKey, auth: _auth, mailController: _mailController, passController: _passController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you have an account?'),
                      TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, SignIn.routeName),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: ColorConstants.AMBER),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _validate(String value, String text) {
    return value.isEmpty ? text : null;
  }
}
