import 'package:flutter/material.dart';
import 'package:najme/games/dino_game/game/hive.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/screens/main/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:najme/data.dart';
import 'package:flame/flame.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      home: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return snapshot.hasData
              ? (isLoggedIn ? HomeScreen() : LoginScreen())
              : Center(child: CircularProgressIndicator());
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Should be deleted
  //await deleteDatabase(join(await getDatabasesPath(), 'najme.db'));
  //await insertData();
  // should be moved to registration
  /*
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', "123456");
  await prefs.setInt('profile_id', 1);
  await prefs.setString('email', "user@example.com");
  await prefs.setDouble('rating', 3.5);
  await prefs.setBool('sound_is_on', true);
   */

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  // Initializes hive and register the adapters.
  await initHive();
  runApp(const NajmeApp());
}