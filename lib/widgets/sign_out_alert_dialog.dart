import 'package:firebase_learning_app/screens/authenticate/authenticate.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({
    Key key,
    @required AuthService authService,
    this.text,
  })  : _authService = authService,
        super(key: key);

  final AuthService _authService;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
      actions: [
        ButtonBar(
          children: [
            TextButton(
                onPressed: () async {
                  await _authService.signOut();
                  await Navigator.pushReplacementNamed(context, Authenticate.routeName);
                },
                child: Text('YES')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('NO'))
          ],
        )
      ],
    );
  }
}
