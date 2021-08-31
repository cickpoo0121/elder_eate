import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

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
    var pic = 'assets/images/disc.png';

    return SafeArea(
      child: Scaffold(
      backgroundColor: pBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pic),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
                width: size.width * 0.85,
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
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    iconEnabledColor: pRegisTxtColor,
                    style:Theme.of(context).textTheme.headline4,
                    underline: Container(
                      color: sBackgroundColor,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
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
                      style:Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.45,
              decoration: BoxDecoration(),
              child: TextButton(
                onPressed: () {
                  print("object");
                },
                child: Text(
                  "วิเคราะห์ข้อมูล",
                  style:Theme.of(context).textTheme.headline5,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
