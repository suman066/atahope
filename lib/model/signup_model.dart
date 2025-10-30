import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String? msg;
  Data? data;

  SignUpModel({
    this.msg,
    this.data,
  });

  SignUpModel copyWith({
    String? msg,
    Data? data,
  }) {
    return SignUpModel(
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    msg: json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? uName;
  String? uNickName;
  String? uGender;
  String? uDob;
  String? uEmail;
  String? uMobile;
  String? countryId;
  String? cityId;
  String? uZip;
  String? uAddress;
  String? uPass;
  String? idustryTypeId;
  String? cWebsite;
  String? cPhoneNumber;
  String? cLicence;
  String? vatNumber;
  String? appFullName;
  String? userType;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.uName,
    this.uNickName,
    this.uGender,
    this.uDob,
    this.uEmail,
    this.uMobile,
    this.countryId,
    this.cityId,
    this.uZip,
    this.uAddress,
    this.uPass,
    this.idustryTypeId,
    this.cWebsite,
    this.cPhoneNumber,
    this.cLicence,
    this.vatNumber,
    this.appFullName,
    this.userType,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? uName,
    String? uNickName,
    String? uGender,
    String? uDob,
    String? uEmail,
    String? uMobile,
    String? countryId,
    String? cityId,
    String? uZip,
    String? uAddress,
    String? uPass,
    String? idustryTypeId,
    String? cWebsite,
    String? cPhoneNumber,
    String? cLicence,
    String? vatNumber,
    String? appFullName,
    String? userType,
    String? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      uName: uName ?? this.uName,
      uNickName: uNickName ?? this.uNickName,
      uGender: uGender ?? this.uGender,
      uDob: uDob ?? this.uDob,
      uEmail: uEmail ?? this.uEmail,
      uMobile: uMobile ?? this.uMobile,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      uZip: uZip ?? this.uZip,
      uAddress: uAddress ?? this.uAddress,
      uPass: uPass ?? this.uPass,
      idustryTypeId: idustryTypeId ?? this.idustryTypeId,
      cWebsite: cWebsite ?? this.cWebsite,
      cPhoneNumber: cPhoneNumber ?? this.cPhoneNumber,
      cLicence: cLicence ?? this.cLicence,
      vatNumber: vatNumber ?? this.vatNumber,
      appFullName: appFullName ?? this.appFullName,
      userType: userType ?? this.userType,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    uName: json["uName"],
    uNickName: json["uNickName"],
    uGender: json["uGender"],
    uDob: json["uDOB"],
    uEmail: json["uEmail"],
    uMobile: json["uMobile"],
    countryId: json["countryId"],
    cityId: json["cityId"],
    uZip: json["uZip"],
    uAddress: json["uAddress"],
    uPass: json["uPass"],
    idustryTypeId: json["idustryTypeId"],
    cWebsite: json["cWebsite"],
    cPhoneNumber: json["cPhoneNumber"],
    cLicence: json["cLicence"],
    vatNumber: json["vatNumber"],
    appFullName: json["appFullName"],
    userType: json["userType"],
    isActive: json["isActive"],
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uName": uName,
    "uNickName": uNickName,
    "uGender": uGender,
    "uDOB": uDob,
    "uEmail": uEmail,
    "uMobile": uMobile,
    "countryId": countryId,
    "cityId": cityId,
    "uZip": uZip,
    "uAddress": uAddress,
    "uPass": uPass,
    "idustryTypeId": idustryTypeId,
    "cWebsite": cWebsite,
    "cPhoneNumber": cPhoneNumber,
    "cLicence": cLicence,
    "vatNumber": vatNumber,
    "appFullName": appFullName,
    "userType": userType,
    "isActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
