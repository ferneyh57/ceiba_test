import 'package:ceiba_app/ui/app.dart';
import 'package:ceiba_app/ui/config/injector/di.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}
