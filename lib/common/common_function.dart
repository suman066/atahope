import 'dart:convert';

import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/hive_db_provider.dart';
import 'package:flutter/material.dart';

import '../main.dart';


BuildContext? get ctx => AppRoutes.ctx;
Future<void> setHeaderData({String? token,String? newToken,String? userId,}) async{
  Map<String, String> myMap = ApiHeaders.headers;
  myMap['content-type'] = 'application/json';
  myMap['uuid'] = '';
  myMap['appname'] = 'cms';
  myMap['scheme'] = 'https';
  if(!checkEmpty(token)){
    myMap['token'] = token??"";
    await HiveDBService().hiveSetString(HiveConstants.token,token??"");
  }
  if(!checkEmpty(newToken)){
    myMap['new-token'] = newToken??"";
    await HiveDBService().hiveSetString(HiveConstants.newToken,newToken??"");
  }
  if(!checkEmpty(userId)){
    myMap['userid'] =userId??"";
    await HiveDBService().hiveSetString(HiveConstants.userId, userId??"");
  }
  myMap['config'] =staticConfig;
  ApiHeaders.headers = myMap;
  await HiveDBService().hiveSetObject(HiveConstants.headers, ApiHeaders.headers);
  await HiveDBService().hiveSetString(HiveConstants.email, "");
  await HiveDBService().hiveSetString(HiveConstants.password,  "");
}
Future<void> setUserDetails(Map<String, dynamic> userdata) async {
  Map<String, dynamic> userMap =userdata;
  await HiveDBService().hiveUserDataSet(HiveConstants.userData, userMap);
}
Future<void> setHeadersData({String? token,String? newToken,String? userId, String? username, Map<String, dynamic>? xToken, String? connectionName}) async{
  Map<String, String> myMap = {};
  myMap['content-type'] = 'application/json;charset=UTF-8';
  myMap['uuid'] = '';
  myMap['appname'] = 'cms';
  myMap['scheme'] = 'https';
  if(xToken!=null){

    var jsonString = jsonEncode(xToken);
    String base64Encoded = base64Encode(utf8.encode(jsonString));

    print(base64Encoded);
    myMap['X-DB-Credentials'] =base64Encoded??"";
    await HiveDBService().hiveSetString("connection_name",connectionName??"connection_name");
    await HiveDBService().hiveSetString("X-DB-Credentials",base64Encoded??"");
  }
  myMap['prj'] = "";
  myMap['config'] =staticConfig;
  ApiHeaders.headers = myMap;
  await HiveDBService().hiveSetObject("headers", ApiHeaders.headers);
}
bool checkEmpty(mixedVar) {
  //print('checkEmpty in 1');
  if (mixedVar is List || mixedVar is Map) {
    if (mixedVar.isEmpty) {
      return true;
    }
  } else {
    //print('checkEmpty in 2');
    var undef;
    var undefined;
    var i;
    var emptyValues = [undef, null, 'null', 'Null', 'NULL', false, 0, '', '0', '0.00', '0.0', 'empty', undefined, 'undefined'];
    var len = emptyValues.length;
    if (mixedVar is String) {
      mixedVar = mixedVar.trim();
    }

    for (i = 0; i < len; i++) {
      if (mixedVar == emptyValues[i]) {
        return true;
      }
    }
  }
  return false;
}

Color colorFromString(String colorString) {
  // Ensure the string is in the correct format
  return Color(int.parse(colorString));
}
void showToastMessage(BuildContext context, bool isSuccess, String? message, {Color? color, Color? textColor, TextStyle? textStyle}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message ?? "", style: textStyle ?? TextStyle(color: textColor ?? Colors.white)),
      backgroundColor: color ?? (isSuccess ? Colors.green : Colors.red),
    ),
  );
}

String? checkStatus(String statusCode) {
  // print("checkStatus ---> statusCode $statusCode status $status message $message");
  String resultStatus;
  if (statusCode == "200") {
    resultStatus = "success";
    // showToastMessage(ctx!, true, message);
    return resultStatus;
  } else if (statusCode == "401") {
    resultStatus = "failure";
    return resultStatus;
  } else {
    resultStatus = "failure";
    showToastMessage(ctx!, false, "Something went wrong!");
    return resultStatus;
  }
}




