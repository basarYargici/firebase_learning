import 'package:firebase_learning_app/config/constants/color_constants.dart';
import 'package:firebase_learning_app/config/constants/constants.dart';
import 'package:firebase_learning_app/config/constants/string_constants.dart';
import 'package:firebase_learning_app/config/size_config.dart';
import 'package:firebase_learning_app/models/friend.dart';
import 'package:firebase_learning_app/screens/home/home_screen.dart';
import 'package:firebase_learning_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:provider/provider.dart';

class FriendForm extends StatefulWidget {
  static String routeName = '/friend_form_screen';

  @override
  _FriendFormState createState() => _FriendFormState();
}

class _FriendFormState extends State<FriendForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var newFriend = Provider.of<DatabaseService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(Constants.maxPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'name',
                    hintText: 'name',
                  ),
                  controller: _nameController,
                  validator: (value) => _validate(value, StringConstants.MAIL_VALIDATION_ERROR)),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'age',
                    hintText: 'age',
                  ),
                  controller: _ageController,
                  obscureText: true,
                  validator: (value) => _validate(value, StringConstants.PASSWORD_VALIDATION_ERROR)),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              SignInButtonBuilder(
                icon: Icons.add,
                backgroundColor: ColorConstants.BLUE_GREY,
                onPressed: () {
                  newFriend.addFriend(context, Friend(name: _nameController.text, age: _ageController.text));
                  Navigator.pushNamed(context, Home.routeName);
                },
                text: 'Add friend',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validate(String value, String text) {
    return value.isEmpty ? text : null;
  }
}
