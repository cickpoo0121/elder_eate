import 'dart:convert';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/main/home/home.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  UserProfile? _userProfile;
  SharedPreferences? pref;
  String? _userEmail;
  SharedPreferences? _pref;
  StoredAccessToken? _accessToken;
  TextEditingController _userNameText = TextEditingController();
  TextEditingController _weightText = TextEditingController();
  TextEditingController _heightText = TextEditingController();
  TextEditingController _ageText = TextEditingController();
  String? _dropdownValue;
  bool _readOnly = true;
  bool _loadData = true;
  var _userData;
  double? _bmr, _cal, _sug, _sodm;

  @override
  bool get wantKeepAlive => true;

  Future loadUser() async {
    _userData = await SqlService.instance.userLoad();
    _userNameText.text = _userData[0]['Username'];
    _weightText.text = _userData[0]['Weight'].toString();
    _heightText.text = _userData[0]['Height'].toString();
    _ageText.text = _userData[0]['Age'].toString();
    _dropdownValue = _userData[0]['Disease'];

    setState(() {
      _loadData = false;
    });
  }

  fineBalnce() {
    // final user = User.fromJson(_userData[0]);
    // final sex = 0; // sex: 0 is male, 1 is female

    if (_userData[0]['Sex'] == 0) {
      _bmr = 66 +
          (13.7 * _userData[0]['Weight']) +
          (5 * _userData[0]['Height']) -
          (6.8 * _userData[0]['Age']);
    } else {
      _bmr = 665 +
          (9.6 * _userData[0]['Weight']) +
          (1.8 * _userData[0]['Height']) -
          (4.7 * _userData[0]['Age']);
    }

    _cal = _bmr! * 1.2;

    if (_userData[0]['Disease'] == 'ไม่มีโรคประจำตัว') {
      setState(() {
        _cal = _cal;
        _sug = 24;
        _sodm = 2000;
      });
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
  }

  Future<void> initPlatformState() async {
    UserProfile? userProfile;
    StoredAccessToken? accessToken;

    try {
      accessToken = await LineSDK.instance.currentAccessToken;
      if (accessToken != null) {
        userProfile = await LineSDK.instance.getProfile();
      }
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      _userProfile = userProfile;
      _accessToken = accessToken;
    });
  }

  void _loginLine() async {
    try {
      final result = await LineSDK.instance
          .login(option: LoginOption(false, 'aggressive'));
      final accessToken = await LineSDK.instance.currentAccessToken;

      var userId = result.userProfile?.userId;

      pref = await SharedPreferences.getInstance();
      pref!.setString('lineId', userId.toString());

      setState(() {
        _accessToken = accessToken;
      });
    } on PlatformException catch (e) {
      // Error handling.
      print("Error=====> $e");
    }
  }

  void _signOut() async {
    pref = await SharedPreferences.getInstance();
    try {
      await LineSDK.instance.logout();
      pref!.remove('lineId');
      setState(() {
        _userProfile = null;
        _accessToken = null;
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future getAccessToken() async {
    try {
      final result = await LineSDK.instance.currentAccessToken;
      return result?.value;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => Home(currentPage: 0));
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'โปรไฟล์',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: _loadData
            ? Center(child: CircularProgressIndicator())
            : ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: size.height, minWidth: size.width),
                child: Container(
                  decoration: BoxDecoration(
                    color: pBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            radius: size.width * 0.23,
                            backgroundColor: pButtonColor,
                            child: Text(
                              _userData[0]['Username'],
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Form(
                          key: _formkey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: TextFormField(
                                        readOnly: _readOnly,
                                        controller: _userNameText,
                                        decoration: InputDecoration(
                                          hintText: _userNameText.text,
                                          prefixIcon: Icon(Icons.account_box),
                                          hintStyle:
                                              TextStyle(color: pRegisTxtColor),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return 'กรุณากรอกข้อมูล';
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: TextFormField(
                                        readOnly: _readOnly,
                                        keyboardType: TextInputType.number,
                                        controller: _weightText,
                                        decoration: InputDecoration(
                                          hintText: _weightText.text,
                                          prefixIcon:
                                              Icon(Icons.line_weight_rounded),
                                          hintStyle:
                                              TextStyle(color: pRegisTxtColor),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return 'กรุณากรอกข้อมูล';
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: TextFormField(
                                        readOnly: _readOnly,
                                        keyboardType: TextInputType.number,
                                        controller: _heightText,
                                        decoration: InputDecoration(
                                            hintText: _heightText.text,
                                            prefixIcon: Icon(Icons
                                                .accessibility_new_rounded),
                                            hintStyle: TextStyle(
                                                color: pRegisTxtColor),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return 'กรุณากรอกข้อมูล';
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: TextFormField(
                                        readOnly: _readOnly,
                                        keyboardType: TextInputType.number,
                                        controller: _ageText,
                                        decoration: InputDecoration(
                                            hintText: _ageText.text,
                                            prefixIcon:
                                                Icon(Icons.date_range_rounded),
                                            hintStyle: TextStyle(
                                                color: pRegisTxtColor),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return 'กรุณากรอกข้อมูล';
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      value: _dropdownValue,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                      onChanged: _readOnly
                                          ? null
                                          : (String? newValue) {
                                              setState(() {
                                                _dropdownValue = newValue;
                                              });
                                            },
                                      items: [
                                        'โรคเบาหวาน',
                                        'โรคความดันโลหิตสูง',
                                        'ไม่มีโรคประจำตัว',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        _dropdownValue.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'กรุณากรอกข้อมูล';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: size.height * 0.040,
                        ),
                        Container(
                          width: size.width * 0.85,
                          decoration: BoxDecoration(),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              _accessToken == null ? _loginLine() : _signOut();
                            },
                            child: Text(
                              _accessToken == null
                                  ? "เชื่อมต่อไลน์เพื่อรับการแจ้งเตือน"
                                  : "ยกเลิกการเชื่อมต่อ",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        // Container(
                        //   width: size.width * 0.85,
                        //   decoration: BoxDecoration(),
                        //   child: TextButton(
                        //     style:
                        //         TextButton.styleFrom(backgroundColor: Colors.green),
                        //     onPressed: () {
                        //       _signOut();
                        //     },
                        //     child: Text(
                        //       'ยกเลิก',
                        //       style: Theme.of(context).textTheme.headline5,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.03,
                        // ),
                        Container(
                          width: size.width * 0.85,
                          decoration: BoxDecoration(),
                          child: TextButton(
                            onPressed: () async {
                              _pref = await SharedPreferences.getInstance();
                              if (!_readOnly) {
                                final isValid =
                                    _formkey.currentState!.validate();
                                if (isValid) {
                                  final resp =
                                      await SqlService.instance.userUpdate(
                                    _userData[0]['User_ID'],
                                    _userNameText.text,
                                    double.parse(_weightText.text),
                                    double.parse(_heightText.text),
                                    int.parse(_ageText.text),
                                    _dropdownValue.toString(),
                                  );
                                  if (resp) {
                                    fineBalnce();
                                    Map blance = {
                                      'calroies': _cal,
                                      'sugar': _sug,
                                      'sodium': _sodm
                                    };
                                    _pref!.remove('balance');
                                    _pref!.setString(
                                        'balance', jsonEncode(blance));
                                    setState(() {
                                      _readOnly = true;
                                      loadUser();
                                    });
                                  }
                                }
                              } else {
                                setState(() {
                                  _readOnly = false;
                                });
                              }
                            },
                            child: Text(
                              _readOnly ? "แก้ไขข้อมูล" : "ยืนยัน",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
