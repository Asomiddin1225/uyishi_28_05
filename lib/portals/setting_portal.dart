import 'package:dars_45/controller/Settings_Controller.dart';
import 'package:flutter/material.dart';


class SettingsPortal extends InheritedWidget {
  final SettingsController settingsController;
  SettingsPortal({
    required this.settingsController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SettingsPortal oldWidget) {
    return oldWidget.settingsController != settingsController;
  }

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsPortal>()!
        .settingsController;
  }
}
