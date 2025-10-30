import 'dart:ui';

import 'package:flutter/material.dart';

const darkerThemeBlue= Color.fromRGBO(6, 28, 43, 1);

const darkThemeBlue= Color.fromRGBO(8, 35, 54, 1.0);

const lightThemeBlue= Color.fromRGBO(16, 51, 75, 1.0);

const lightTextBlue= Color.fromRGBO(78, 121, 151, 1.0);

const lightTextGrey= Color.fromRGBO(212, 208, 208, 0.33);

const textCol=Colors.white70;

const circularBGCol=Colors.orange;
var circularStrokeCol=Colors.orange[50];
const double strokeWidth=4;

const FontWeight font_bold = FontWeight.w600;

const orangeCol=Color.fromRGBO(227, 97, 38, 1.0);
const lightOrangeCol=Color.fromRGBO(227, 97, 38, 0.5);

const darkOrangeCol=Color.fromRGBO(193, 81, 31, 1.0);
double screenHeight=0;
double screenWidth=0;




class Urls {
  static String baseUrl = "https://api.tholair.com/v1/user-master/";
}
class ApiKeys {
  static const String signup = '';
  static const String verifyOTP = 'validate-otp';
  static const String login = 'login';
}
class ApiHeaders {
  static Map<String, String> headers = {};
}


class HiveConstants {
  static const String token = 'token';
  static const String newToken = 'new_token';
  static const String userId = 'userId';
  static const String prj = 'prj';
  static const String headers = 'headers';
  static const String config = 'config';
  static const String email = 'email';
  static const String password = 'password';
  static const String userName = 'userName';
  static const String profileImage = 'profileImage';
  static const String remEmail = 'remEmail';
  static const String remPassword = 'remPassword';
  static const String userData = 'userData';
  static const String tempEmail = 'tempEmail';
  static String projectId = 'projectId';
  static String projectName = 'projectName';
  static String pageId = 'pageId';
  static String pageName = 'pageName';
  static String isLogin = 'isLogin';
  static String currentWorkspaceId = 'currentWorkspaceId';
  static const String connectionKey = 'connections';
// static TemplateState? state;
}