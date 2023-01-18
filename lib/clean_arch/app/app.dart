import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najme/data.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/screens/main/loading_screen.dart';
import 'package:najme/screens/main/login_screen.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      // theme: getAppTheme(),
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: RoutesManager.splashRoute,
      home: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return snapshot.hasData
              ? (isLoggedIn ? HomeScreen() : LoginScreen())
              : LoadingScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
