import 'dart:developer';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WeighHeight extends StatefulWidget {
  const WeighHeight({Key? key}) : super(key: key);

  @override
  _WeighHeightState createState() => _WeighHeightState();
}

class _WeighHeightState extends State<WeighHeight> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController weightTxt = TextEditingController();
  TextEditingController heightTxt = TextEditingController();
  UserController _userController = Get.find();
  var pic = 'assets/icons/weighHeight.svg';

  int _sexValue = 0;
  void changeSex(value) {
    setState(() {
      _sexValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: pBackgroundColor,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          elevation: 0.0),
      backgroundColor: pBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: pPadding,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width * 1,
                  ),
                  Positioned(
                    child: SvgPicture.asset(
                      pic,
                      width: size.width * 0.7,
                    ),
                    top: 0,
                    right: 0,
                    left: 100,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: pButtonColor,
                      value: 0,
                      groupValue: _sexValue,
                      onChanged: changeSex),
                  Text('ชาย'),
                  Radio(
                      activeColor: pButtonColor,
                      value: 1,
                      groupValue: _sexValue,
                      onChanged: changeSex),
                  Text('หญิง'),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: weightTxt,
                              decoration: InputDecoration(
                                hintText: 'น้ำหนัก',
                                prefixIcon: Icon(Icons.line_weight_rounded),
                                hintStyle: TextStyle(color: pRegisTxtColor),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().length == 0) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: heightTxt,
                              decoration: InputDecoration(
                                  hintText: 'ส่วนสูง',
                                  prefixIcon:
                                      Icon(Icons.accessibility_new_rounded),
                                  hintStyle: TextStyle(color: pRegisTxtColor),
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value == null || value.trim().length == 0) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                            )),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.035,
              ),
              Container(
                width: size.width * 0.28,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      // _userController.updateUser(target, value);
                      _userController.user.last.sex = _sexValue;
                      _userController.user.last.weight =
                          double.parse(weightTxt.text);
                      _userController.user.last.height =
                          double.parse(heightTxt.text);
                      Get.toNamed('/Disease');
                    }
                    inspect(_userController.user);
                  },
                  child: Text(
                    "ถัดไป",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
