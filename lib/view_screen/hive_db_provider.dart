import 'dart:convert';
import 'dart:io';

import 'package:atahope/Constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


enum DbTables {
  ALL_APIS,
  USER_DATA,
  REM,
}

enum ConnectionType {
  CONNECTION_BOX,
}

class HiveDBService {
  Box<dynamic>? allStrings;
  Box<dynamic>? rem;
  Box<dynamic>? connectionData;
  String? previewId;
  Box<dynamic>? userData;

  static final HiveDBService _singleton = HiveDBService._internal();

  factory HiveDBService() {
    return _singleton;
  }

  HiveDBService._internal();

  Future open() async {
    try {
      if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        final directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);
      }



      allStrings = await Hive.openBox(DbTables.ALL_APIS.name);
      rem = await Hive.openBox(DbTables.REM.name);
      userData = await Hive.openBox(DbTables.USER_DATA.name);
      connectionData = await Hive.openBox(ConnectionType.CONNECTION_BOX.name);
    } catch (e) {
      print("Hive init error: $e");
    }
  }

  Future close() async {
    try {
      if (allStrings != null && allStrings!.isOpen) {
        await allStrings!.close();
      }
    } catch (e) {}
  }



  Future clearAll() async {
    try {
      if (!(allStrings != null && allStrings!.isOpen)) {
        allStrings = await Hive.openBox(DbTables.ALL_APIS.name);
      }
      await allStrings!.clear();
    } catch (e) {}
  }

  Future hiveRemSetString(String key, String value) async {
    if (!(rem != null && rem!.isOpen)) {
      rem = await Hive.openBox(DbTables.REM.name);
    }
    await rem!.put(key, value);
  }

  Future<String?> hiveRemGetString(String key) async {
    dynamic data;
    try {
      if (!(rem != null && rem!.isOpen)) {
        rem = await Hive.openBox(DbTables.REM.name);
      }
      if (rem!.containsKey(key)) {
        data = rem!.get(key);
      }
    } catch (e) {}
    return data as String?;
  }

  Future hiveSetString(String key, String value) async {
    if (!(allStrings != null && allStrings!.isOpen)) {
      allStrings = await Hive.openBox(DbTables.ALL_APIS.name);
    }
    await allStrings!.put(key, value);
  }

  Future<String?> hiveGetString(String key) async {
    dynamic data;
    try {
      if (!(allStrings != null && allStrings!.isOpen)) {
        allStrings = await Hive.openBox(DbTables.ALL_APIS.name);
      }
      if (allStrings!.containsKey(key)) {
        data = allStrings!.get(key);
      }
    } catch (e) {}
    return data as String?;
  }

  Future hiveDeleteString(String key) async {
    try {
      if (!(allStrings != null && allStrings!.isOpen)) {
        allStrings = await Hive.openBox(DbTables.ALL_APIS.name);
      }
      if (allStrings!.containsKey(key)) {
        await allStrings!.delete(key);
      }
    } catch (e) {}
  }

  Future hiveSetObject(String key, Map<String, dynamic> value) async {
    if (!(allStrings != null && allStrings!.isOpen)) {
      allStrings = await Hive.openBox(DbTables.USER_DATA.name);
    }
    await allStrings!.put(key, value);
  }

  Future<Map<String, dynamic>?> hiveGetObject(String key) async {
    Map<String, dynamic>? data;
    try {
      if (!(allStrings != null && allStrings!.isOpen)) {
        allStrings = await Hive.openBox(DbTables.USER_DATA.name);
      }
      if (allStrings!.containsKey(key)) {
        data = allStrings!.get(key);
      }
    } catch (e) {}
    return data;
  }

  /// Dark mode
  Future hiveSetDarkMode(bool value) async {
    var box = await Hive.openBox('temp_template_data');
    await box.put('darkMode', value);
  }

  Future<bool> hiveGetDarkMode() async {
    var box = await Hive.openBox('temp_template_data');
    bool? data = box.get('darkMode');
    return data ?? true;
  }



  /// Get loggedInUserId from Hive
  Future<String?> _getLoggedInUserId() async {
    final loggedInUserId = await hiveGetString(HiveConstants.userId);
    return loggedInUserId;
  }





  // get and set for login
  Future<void> hiveUserDataSet(String key, Map<String, dynamic> value) async {
    if (!(userData != null && userData!.isOpen)) {
      userData = await Hive.openBox(DbTables.USER_DATA.name);
    }
    await userData!.put(key, value);
  }

  Future<Map<String, dynamic>?> hiveUserDataGet(String key) async {
    Map<String, dynamic>? data;
    try {
      if (!(userData != null && userData!.isOpen)) {
        userData = await Hive.openBox(DbTables.USER_DATA.name);
      }
      if (userData!.containsKey(key)) {
        data = Map<String, dynamic>.from(userData!.get(key));
      }
    } catch (e) {
      if (kDebugMode) {

      }
    }
    return data;
  }


  Future<void> clearUserData() async {
    if (!(userData != null && userData!.isOpen)) {
      userData = await Hive.openBox(DbTables.USER_DATA.name);
    }
    await userData?.clear();
  }
  /// Save login status
  Future<void> hiveSetLogin(bool value) async {
    if (!(userData != null && userData!.isOpen)) {
      userData = await Hive.openBox(DbTables.USER_DATA.name);
    }
    await userData!.put('isLogin', value);
  }

  /// Get login status
  Future<bool> hiveGetLogin() async {
    if (!(userData != null && userData!.isOpen)) {
      userData = await Hive.openBox(DbTables.USER_DATA.name);
    }
    bool? data = userData!.get('isLogin');
    return data ?? false; // default false if not found
  }
}
