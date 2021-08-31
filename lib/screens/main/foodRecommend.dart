import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class FoodRecommend extends StatefulWidget {
  const FoodRecommend({Key? key}) : super(key: key);

  @override
  _FoodRecommendState createState() => _FoodRecommendState();
}

class _FoodRecommendState extends State<FoodRecommend> {
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
            'อาหารแนะนำ',
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
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                                  Icons.local_dining_rounded,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "มะม่วง",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                                  Icons.local_dining_rounded,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "ส้ม",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                                  Icons.local_dining_rounded,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "ฝรั่ง",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ))),
        ));
  }
}
