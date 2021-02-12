import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learning_app/screens/wrapper.dart';
import 'package:flutter/material.dart';

import 'config/constants/string_constants.dart';
import 'config/routes.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.APP_TITLE,
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      routes: routes,
      initialRoute: Wrapper.routeName,
    );
  }
}
