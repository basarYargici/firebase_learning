import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final String routeName = '/home_screen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.HOME_SCREEN_APP_BAR_TITLE),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
