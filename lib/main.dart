import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:najme/CA/core/najme_app.dart';

import 'CA/Core/Services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ServicesLocator().init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "EG"),
        Locale("ar", "EG"),
      ],
      path: 'assets/translations',
      startLocale: const Locale("ar", "EG"),
      fallbackLocale: const Locale("ar", "EG"),
      useOnlyLangCode: true,
      child: const NajmeApp(),
    ),
  );
}
