import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({Key? key}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        title: const Text(
          'เพิ่มมื้ออาหาร',
        ),
      ),
      body: Container(
        color: pBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Container(
                width: size.width * 0.85,
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'ค้นหารายการอาหาร',
                    prefixIcon: Icon(Icons.email),
                    hintStyle: TextStyle(color: pRegisTxtColor),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
            ),
            CircleAvatar(
              radius: size.width * 0.25,
              backgroundColor: sBackgroundColor,
              child: IconButton(
                icon: const Icon(Icons.camera_alt),
                color: pHeaderTabColor,
                iconSize: 110,
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
