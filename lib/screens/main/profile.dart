import 'package:elder_eate/constant.dart';
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
  UserProfile? _userProfile;
  String? _userEmail;
  StoredAccessToken? _accessToken;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
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
        child: (ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: size.height, minWidth: size.width),
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
                      "Profile",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          color: sBackgroundColor),
                      height: size.height * 0.08,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_box,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("ธิดาพร ชาวคูเวียง",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          color: sBackgroundColor),
                      height: size.height * 0.08,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.line_weight_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("65",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          color: sBackgroundColor),
                      height: size.height * 0.08,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.accessibility_new_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("180",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          color: sBackgroundColor),
                      height: size.height * 0.08,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.date_range_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("15/05/2542",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40.0),
                        color: sBackgroundColor),
                    height: size.height * 0.08,
                    width: size.width * 0.85,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.elderly_rounded,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("โรคเบาหวาน",
                                style: Theme.of(context).textTheme.headline4),
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
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        _accessToken == null ? _loginLine() : _signOut();
                      },
                      child: Text(
                        _accessToken == null
                            ? "เชื่อมต่อไลน์เพื่อรับการแจ้งเตือน"
                            : "ยกเลิกการเชื่อมต่อ",
                        style: Theme.of(context).textTheme.headline5,
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
                        // _signOut();
                        alert();
                      },
                      child: Text(
                        "เช็กข้อมูลผู้ใช้",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
