import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najme/CA/Core/Config/bloc_providers.dart';
import 'package:najme/CA/core/config/page_route_names.dart';
import 'config/routes.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return AppProviders.multiProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: PageRouteName.initial,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
