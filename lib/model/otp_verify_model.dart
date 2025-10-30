// To parse this JSON data, do
//
//     final otpValidateModel = otpValidateModelFromJson(jsonString);

import 'dart:convert';

OtpValidateModel otpValidateModelFromJson(String str) =>
    OtpValidateModel.fromJson(json.decode(str));

String otpValidateModelToJson(OtpValidateModel data) =>
    json.encode(data.toJson());

class OtpValidateModel {
  String? msg;
  Data? data;

  OtpValidateModel({
    this.msg,
    this.data,
  });

  factory OtpValidateModel.fromJson(Map<String, dynamic> json) =>
      OtpValidateModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
  };

  /// ✅ copyWith method
  OtpValidateModel copyWith({
    String? msg,
    Data? data,
  }) {
    return OtpValidateModel(
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }
}

class Data {
  String? isActive;

  Data({
    this.isActive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "isActive": isActive,
  };

  /// ✅ copyWith method
  Data copyWith({
    String? isActive,
  }) {
    return Data(
      isActive: isActive ?? this.isActive,
    );
  }
}
