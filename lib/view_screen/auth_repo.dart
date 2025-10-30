import 'dart:convert';

import 'package:atahope/Constants/constants.dart';
import 'package:atahope/common/common_function.dart';
import 'package:atahope/model/login_model.dart';
import 'package:atahope/model/otp_verify_model.dart';
import 'package:atahope/model/signup_model.dart';
import 'package:atahope/view_screen/hive_db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthRepo {

  Future<SignUpModel> doSignup(Map<String, dynamic> params) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      final response = await http.post(
        Uri.parse(Urls.baseUrl),
        headers: headers,
        body: jsonEncode(params),
      );
      print("response${response.body}");
      // Decode response.body into Map<String, dynamic>
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      final SignUpModel dataModel = SignUpModel.fromJson(decodedJson);

      if (checkStatus(
          '${response.statusCode}') == "success" && dataModel.msg == "Duplicate Email, New OTP send") {
        return dataModel;
      }else if (checkStatus('${response.statusCode}') == "success" && dataModel.msg == "Data Created Succesfully"){
        return dataModel;
      }
      else {
        return dataModel;
      }
    } catch (e) {
      print("Error: $e");
      showToastMessage(ctx!, false, "Something went wrong!");
      return SignUpModel(); // return empty SignUpModel instead of fromJson("")
    }
  }


 Future<OtpValidateModel> verifyOTP(Map<String, dynamic> params) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      Response response = await http.post(Uri.parse(Urls.baseUrl + ApiKeys.verifyOTP), headers: headers, body: jsonEncode(params));
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      final OtpValidateModel dataModel = OtpValidateModel.fromJson(decodedJson);
      if (checkStatus('${response.statusCode}') == "success" && dataModel.msg == "OTP Validate Succesfully"){
        return dataModel;
      }
      else {
        showToastMessage(ctx!, false, dataModel.msg);
        return dataModel;
      }
    } catch (e) {
      debugPrint("verifyOTP getting error::: ${e}");
      showToastMessage(ctx!, false, "Something went wrong!");
      return OtpValidateModel();
    }
  }

  Future<LoginModel> doLogin(Map<String, dynamic> params) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
      };
      Response response = await http.post(Uri.parse(Urls.baseUrl + ApiKeys.login), headers: headers, body: jsonEncode(params));
      print("response agaian  : ${response.body}");
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      final LoginModel dataModel = LoginModel.fromJson(decodedJson);
      if (checkStatus('${response.statusCode}') == "success" && dataModel.success == true){
        Map<String, dynamic> userdata=dataModel.data!.toJson();
        await setUserDetails(userdata);
        await HiveDBService().hiveSetLogin(true);
        showToastMessage(ctx!, true, "User Login Successfully");
        /*Navigator.pushAndRemoveUntil(
          ctx!,
          MaterialPageRoute<void>(
            builder: (context) => const WelcomeOnboardingScreen(),
          ),
              (route) => false, // removes all previous routes
        );*/
        return dataModel;
      }
      else {
        showToastMessage(ctx!, false, dataModel.msg);
        return dataModel;
      }

    } catch (e) {
      print("error again $e");
      showToastMessage(ctx!, false, "Something went wrong!");
      print("object");
      return LoginModel();
    }
  }


}
