
import 'package:dars_45/controller/Settings_Controller.dart';
import 'package:dars_45/portals/setting_portal.dart';
import 'package:dars_45/views/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SettingsPortal(
      settingsController: SettingsController(),
      child: Builder(builder: (context) {
        return ListenableBuilder(
            listenable: SettingsPortal.of(context),
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                  backgroundColor: Colors.amber,
                )),
                darkTheme: ThemeData.dark(),
                themeMode: SettingsPortal.of(context).themeMode,
                home: HomeScreen(),
              );
            });
      }),
    );
  }
}
