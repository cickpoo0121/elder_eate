import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Disease extends StatefulWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  String dropdownValue = 'โรคเบาหวาน';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pic = 'assets/icons/health.svg';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: pBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0),
      backgroundColor: pBackgroundColor,
      body: Padding(
        padding: pPadding,
        child: SingleChildScrollView(
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
                      width: size.width * 1,
                    ),
                    top: -100,
                    right: -20,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Icon(Icons.health_and_safety),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        style: Theme.of(context).textTheme.headline4,
                        underline: Container(
                          color: sBackgroundColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          "โรคประจำตัว",
                          'โรคเบาหวาน',
                          'โรคความดันโลหิตสูง',
                          'ไม่มีโรคประจำตัว',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "โรคประจำตัว",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.17,
              ),
              Container(
                width: size.width * 0.45,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Progress');
                  },
                  child: Text(
                    "วิเคราะห์ข้อมูล",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
