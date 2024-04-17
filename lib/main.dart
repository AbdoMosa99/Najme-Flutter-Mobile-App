import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:najme/CA/core/najme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "EG"),
        Locale("ar", "EG"),
      ],
      path: 'assets/translations',
      startLocale: const Locale("en", "EG"),
      fallbackLocale: const Locale("en", "EG"),
      useOnlyLangCode: true,
      child: const NajmeApp(),
    ),
  );
}
