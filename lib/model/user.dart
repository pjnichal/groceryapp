import 'dart:convert';

MyUser myuserFromJson(String str, String uid) =>
    MyUser.fromJson(json.decode(str), uid);

String myuserToJson(MyUser data) => json.encode(data.toJson());

class MyUser {
  MyUser(
      {this.mobile,
      this.description,
      this.town,
      this.pinCode,
      this.addressL1,
      this.fullName,
      this.addressL2,
      this.state,
      this.price,
      this.city,
      this.uid});
  String uid;
  int mobile;
  String description;
  String town;
  int pinCode;
  String addressL1;
  String fullName;
  String addressL2;
  String state;
  int price;
  String city;

  factory MyUser.fromJson(Map<String, dynamic> json, String uids) => MyUser(
        uid: uids,
        mobile: json["mobile"],
        description: json["description"],
        town: json["town"],
        pinCode: json["pin_code"],
        addressL1: json["address_l1"],
        fullName: json["full_name"],
        addressL2: json["address_l2"],
        state: json["state"],
        price: json["price"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "description": description,
        "town": town,
        "pin_code": pinCode,
        "address_l1": addressL1,
        "full_name": fullName,
        "address_l2": addressL2,
        "state": state,
        "price": price,
        "city": city,
      };
}
