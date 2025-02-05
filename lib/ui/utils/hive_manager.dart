import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveManager {
  Box? _mainBox;
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(PostModelAdapter());
    _mainBox = await Hive.openBox(MAIN_BOX);
  }

  Future<void> save<T>(String boxName, List<T> items) async {
    try {
      await _mainBox?.put(boxName, items);
    } catch (e) {
      debugPrint('error at HiveManager save: $e');
    }
  }

  T? get<T>(String boxName) {
    return _mainBox?.get(boxName) as T?;
  }

  List<T>? getMany<T>(String boxName) {
    try {
      final elements = _mainBox?.get(boxName)?.cast<T>();
      return elements;
    } catch (e) {
      debugPrint('error at HiveManager getMany: $e');
      return null;
    }
  }

  Future<void> delete<T>(String boxName) async {
    await _mainBox?.delete(boxName);
  }

  Future<void> close() async {
    await _mainBox?.close();
  }
}
