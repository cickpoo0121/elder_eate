import 'dart:developer';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  UserProfile? _userProfile;
  String? _userEmail;
  StoredAccessToken? _accessToken;
  TextEditingController _userNameText = TextEditingController();
  TextEditingController _weightText = TextEditingController();
  TextEditingController _heightText = TextEditingController();
  TextEditingController _ageText = TextEditingController();
  String? _dropdownValue;
  bool _readOnly = true;
  bool _loadData = true;
  var _userData;

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

  void alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              _accessToken != null ? 'Line User Profile' : 'No data',
              style: TextStyle(color: Colors.black),
            ),
            content: _accessToken != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (_userProfile?.pictureUrl ?? "").isNotEmpty
                          ? Image.network(
                              _userProfile!.pictureUrl.toString(),
                              width: 200,
                              height: 200,
                            )
                          : Icon(
                              Icons.person,
                              size: 30,
                            ),
                      Text(
                        _userProfile!.displayName,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      if (_userEmail != null) Text(_userEmail!),
                      Text(_userProfile!.statusMessage.toString()),
                      Text(
                        'userId: ${_userProfile!.userId}',
                        style: TextStyle(fontSize: 18),
                      ),
                      // Container(
                      //     child: ElevatedButton(
                      //         child: Text('Sign Out'),
                      //         onPressed: () {
                      //           widget.signout();
                      //         },
                      //         style: ElevatedButton.styleFrom(
                      //             primary: Colors.green, onPrimary: Colors.white))),
                    ],
                  )
                : Container(
                    child: Text('No data'),
                  ),
          );
        });
  }

  Future<void> initPlatformState() async {
    UserProfile? userProfile;
    StoredAccessToken? accessToken;

    try {
      accessToken = await LineSDK.instance.currentAccessToken;
      if (accessToken != null) {
        userProfile = await LineSDK.instance.getProfile();
        // print();
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
      final result = await LineSDK.instance.login(
          //   scopes: [
          //   'profile',
          //   'openid',
          //   'email',
          //   'customScope',
          // ]
          );
      final accessToken = await LineSDK.instance.currentAccessToken;

      // final idToken = result.accessToken.idToken;
      // final userEmail = (idToken != null) ? idToken['email'] : null;
      // print(result.toString());
      // var accesstoken = await getAccessToken();
      var displayname = result.userProfile?.displayName;
      // var statusmessage = result.userProfile?.statusMessage;
      // var imgUrl = result.userProfile?.pictureUrl;
      var userId = result.userProfile?.userId;

      // print("AccessToken> " + accesstoken);
      print("DisplayName> " + displayname.toString());
      // print("StatusMessage> " + statusmessage.toString());
      // print("ProfileURL> " + imgUrl.toString());
      print("userId> " + userId.toString());

      setState(() {
        _userProfile = result.userProfile;
        // _userEmail = userEmail;
        _accessToken = accessToken;
      });
    } on PlatformException catch (e) {
      // Error handling.
      print("Error=====> $e");
    }
  }

  void _signOut() async {
    try {
      await LineSDK.instance.logout();
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'โปรไฟล์',
          style: Theme.of(context).textTheme.headline1,
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
                        CircleAvatar(
                          radius: size.width * 0.23,
                          backgroundColor: pButtonColor,
                          child: Text(
                            _userData[0]['Username'],
                            style: TextStyle(fontSize: 30, color: Colors.white),
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
                            onPressed: () {
                              if (!_readOnly) {
                                final isValid =
                                    _formkey.currentState!.validate();
                                if (isValid) {
                                  //TODO: update to database
                                  final resp = SqlService.instance.userUpdate(
                                    _userData[0]['User_ID'],
                                    _userNameText.text,
                                    double.parse(_weightText.text),
                                    double.parse(_heightText.text),
                                    int.parse(_ageText.text),
                                    _dropdownValue.toString(),
                                  );

                                  print('update successed');
                                  setState(() {
                                    _readOnly = true;
                                    loadUser();
                                  });
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
