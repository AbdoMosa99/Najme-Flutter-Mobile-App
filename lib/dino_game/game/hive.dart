// This function will initilize hive with apps documents directory.
// Additionally it will also register all the hive adapters.
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:najme/dino_game/models/player_data.dart';
import 'package:najme/dino_game/models/settings.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<Settings>(SettingsAdapter());
}
