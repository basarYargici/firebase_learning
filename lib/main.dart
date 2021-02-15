import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learning_app/screens/wrapper.dart';
import 'package:firebase_learning_app/services/auth_service.dart';
import 'package:firebase_learning_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => AuthService().user, // if null, user did not signed in
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.APP_TITLE,
        theme: AppTheme.dark(),
        darkTheme: AppTheme.dark(),
        routes: routes,
        initialRoute: Wrapper.routeName,
      ),
    );
  }
}
