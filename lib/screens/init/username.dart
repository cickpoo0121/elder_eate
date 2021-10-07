import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pic = 'assets/icons/userName.svg';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: pBackgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0),
        backgroundColor: pBackgroundColor,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: pPadding,
            child: Column(
              children: [
                SvgPicture.asset(
                  pic,
                  width: size.width * 0.45,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'ชื่อผู้ใช้',
                        prefixIcon: Icon(Icons.account_box),
                        hintStyle: TextStyle(color: pRegisTxtColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'อายุ',
                        prefixIcon: Icon(Icons.date_range_rounded),
                        hintStyle: TextStyle(color: pRegisTxtColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Container(
                  width: size.width * 0.30,
                  decoration: BoxDecoration(),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/WeighHeight');
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
      ),
    );
  }
}
