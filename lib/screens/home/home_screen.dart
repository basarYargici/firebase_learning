import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/screens/authenticate/authenticate.dart';
import 'package:firebase_learning_app/screens/home/components/body.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:firebase_learning_app/widgets/sign_out_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static final String routeName = '/home_screen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) {
              return SignOutAlertDialog(
                authService: _authService,
                text: 'Do you want to sign out?',
              );
            },
            barrierDismissible: false,
          );
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(StringConstants.HOME_SCREEN_APP_BAR_TITLE),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  // logout
                  await _authService.signOut();
                  await Navigator.pushReplacementNamed(context, Authenticate.routeName);
                },
              ),
            ],
          ),
          body: Body(),
        ),
      ),
    );
  }
}
