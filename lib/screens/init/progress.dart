import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/user_controller.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  String _text = "“ กำลังวิเคราะห์ข้อมูลเพื่อหาค่าพลังงานที่เหมาะสมกับคุณ ” ";
  UserController _userController = Get.find();
  SharedPreferences? _pref;
  int _processes = 0;
  Timer? _timer;
  double? _bmr, _cal, _sug, _sodm;

  fineBalnce() {
    final user = _userController.user.last;
    // final sex = 0; // sex: 0 is male, 1 is female

    if (user.sex == 0) {
      _bmr =
          66 + (13.7 * user.weight!) + (5 * user.height!) - (6.8 * user.age!);
    } else {
      _bmr =
          665 + (9.6 * user.weight!) + (1.8 * user.height!) - (4.7 * user.age!);
    }

    _cal = _bmr! * 1.2;
    print(_cal);

    if (user.disease == 'ไม่มีโรคประจำตัว') {
      _cal = _cal;
      _sug = 24;
      _sodm = 2000;
    } else {
      if ((_cal! >= 0) && (_cal! <= 1400)) {
        setState(() {
          _cal = _cal;
          _sug = 6;
          _sodm = 1410;
        });
        return print('case 1');
      }
      if ((_cal! > 1400) && (_cal! <= 1600)) {
        setState(() {
          _cal = _cal;
          _sug = 12;
          _sodm = 1490;
        });
        return print('case 2');
      }
      if ((_cal! > 1600) && (_cal! <= 2000)) {
        setState(() {
          _cal = _cal;
          _sug = 24;
          _sodm = 1610;
        });
        return print('case 3');
      }
    }

    // print('$_cal, $_sug, $_sodm}');
  }

  process() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _processes += 1 + Random().nextInt(4);
        // print(_processes);
        if (_processes > 99) {
          _processes = 100;
          _timer!.cancel();
        }
      });
    });
  }

  cancel() {
    setState(() {
      _timer!.cancel();
    });
  }

  @override
  void initState() {
    process();
    super.initState();
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, '/Individual', (route) => false);
    // });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: pButtonColor,
                child: Text(
                  '$_processes%',
                  style: TextStyle(fontSize: 30.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Text(
                    _text,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              _processes >= 100
                  ? Container(
                      width: size.width * 0.45,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        onPressed: () async {
                          cancel();
                          // inspect(_userController.user);
                          fineBalnce();
                          _pref = await SharedPreferences.getInstance();
                          final user = _userController.user.last;
                          final result =
                              await SqlService.instance.userRegister({
                            'Username': user.username,
                            'Age': user.age,
                            'Sex': user.sex,
                            'Weight': user.weight,
                            'Height': user.height,
                            'Disease': user.disease,
                            'Line_ID': user.line,
                          });

                          if (result == true) {
                            Map blance = {
                              'calroies': _cal,
                              'sugar': _sug,
                              'sodium': _sodm
                            };
                            // TODO:
                            // GetStorage().write(
                            //     'user', _userController.user.last.toJson());
                            _pref!.setString('balance',jsonEncode(blance));

                            // GetStorage().write('blance', blance);
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/Individual', (route) => false);

                            print('register successed');
                          }

                          // print(result);
                          // inspect(result);
                          // Get.toNamed('/Progress');
                          // Navigator.pushNamed(context, '/Progress');
                        },
                        child: Text(
                          "ถัดไป",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
