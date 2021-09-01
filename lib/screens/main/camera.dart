import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //  leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'ถ่ายรูปอาหาร',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: pBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: size.width * 0.10,
                backgroundColor: sBackgroundColor,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: pHeaderTabColor,
                  iconSize: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, '/FoodDetail', arguments: 0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
