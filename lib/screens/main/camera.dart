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
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: sBackgroundColor,
        title: const Text(
          'ถ่ายรูปอาหาร',
        ),
      ),
      body: Container(
        color: pBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: size.height * 0.50,
              ),
              CircleAvatar(
                radius: size.width * 0.10,
                backgroundColor: sBackgroundColor,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: pHeaderTabColor,
                  iconSize: 60,
                  onPressed: () {
                    setState(() {});
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
