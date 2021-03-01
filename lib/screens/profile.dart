import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/getcontrollers/getusersdetailcontroller.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final GetUserDetailsController guc = Get.find();

  bool fName = true;

  bool phone = true;
  bool address = true;
  bool address1 = true;
  bool pincode = true;
  bool isSave = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 5, right: 16),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Obx(() {
          TextEditingController fNamec =
              new TextEditingController(text: guc.user.fullName);
          TextEditingController pincodec =
              new TextEditingController(text: guc.user.pinCode.toString());
          TextEditingController phonec =
              new TextEditingController(text: guc.user.mobile.toString());
          TextEditingController addressc =
              new TextEditingController(text: guc.user.addressL1);
          TextEditingController address1c =
              new TextEditingController(text: guc.user.addressL2);
          TextEditingController cityc =
              new TextEditingController(text: guc.user.city);
          TextEditingController townc =
              new TextEditingController(text: guc.user.town);
          TextEditingController statec =
              new TextEditingController(text: guc.user.state);

          return ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: fNamec,
                  readOnly: fName,
                  enabled: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          fName = !fName;
                          isSave = true;
                        });
                      },
                      icon: Icon(
                        Icons.create,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Full Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phonec,
                  readOnly: phone,
                  enabled: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          phone = !phone;
                          isSave = true;
                        });
                      },
                      icon: Icon(
                        Icons.create,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Phone Number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: addressc,
                  readOnly: address,
                  enabled: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          address = !address;
                          isSave = true;
                        });
                      },
                      icon: Icon(
                        Icons.create,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Address Line 1',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: address1c,
                  readOnly: address1,
                  enabled: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          address1 = !address1;
                          isSave = true;
                        });
                      },
                      icon: Icon(
                        Icons.create,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Address Line 2',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: pincodec,
                  readOnly: pincode,
                  enabled: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pincode = !pincode;
                          isSave = true;
                        });
                      },
                      icon: Icon(
                        Icons.create,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Pin Code',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              new DropdownButton<String>(
                hint: Text('Town'),
                items: <String>['A', 'B', 'C', 'D', 'D', 'D', 'D']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        fNamec.text = guc.user.addressL1;
                        pincodec.text = guc.user.pinCode.toString();
                        phonec.text = guc.user.mobile.toString();
                        addressc.text = guc.user.addressL1;
                        address1c.text = guc.user.addressL2;
                        cityc.text = guc.user.city;
                        townc.text = guc.user.town;
                        statec.text = guc.user.state;
                        phone = true;
                        fName = true;
                        address = true;
                        address1 = true;
                        isSave = false;
                      });
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: isSave ? () {} : null,
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
