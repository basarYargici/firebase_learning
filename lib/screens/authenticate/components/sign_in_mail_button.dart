import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

class buildSignInButton extends StatefulWidget {
  const buildSignInButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required AuthService auth,
    @required TextEditingController mailController,
    @required TextEditingController passController,
  })  : _formKey = formKey,
        _auth = auth,
        _mailController = mailController,
        _passController = passController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final AuthService _auth;
  final TextEditingController _mailController;
  final TextEditingController _passController;

  @override
  _buildSignInButtonState createState() => _buildSignInButtonState();
}

class _buildSignInButtonState extends State<buildSignInButton> {
  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
        height: SizeConfig.screenHeight * 0.08,
        icon: Icons.verified_user,
        backgroundColor: ColorConstants.BLUE_GREY,
        text: StringConstants.SIGN_IN_MAIL,
        fontSize: Constants.bigFontSize,
        onPressed: () async {
          if (widget._formKey.currentState.validate()) {
            // TODO pass user information
            User user = await widget._auth.signInMail(context, widget._mailController.text.trim(), widget._passController.text.trim());
            if (user != null) {
              await Navigator.pushReplacementNamed(context, Home.routeName);
            }
          }
        });
  }
}
