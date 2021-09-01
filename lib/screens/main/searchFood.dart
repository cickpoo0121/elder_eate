import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: pHeaderTabColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            backgroundColor: pHeaderTabColor,
            centerTitle: true,
            title: Text(
              'เพิ่มมื้ออาหาร',
              style: Theme.of(context).textTheme.headline1,
            ),
            elevation: 0.0),
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
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                    child: Container(
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'ค้นหารายการอาหาร',
                      prefixIcon: Icon(Icons.search_rounded),
                      hintStyle: TextStyle(color: pRegisTxtColor),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: size.height * 0.25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Camera');
                  },
                  child: CircleAvatar(
                      radius: size.width * 0.25,
                      backgroundColor: sBackgroundColor,
                      child: Icon(
                        Icons.camera_alt,
                        color: pHeaderTabColor,
                        size: 110,
                      )),
                ),
              ],
            ),
          ),
        ))));
  }
}
