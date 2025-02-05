import 'package:ceiba_app/ui/app.dart';
import 'package:ceiba_app/ui/config/injector/di.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<HiveManager>().initHive();
  runApp(const MyApp());
}
