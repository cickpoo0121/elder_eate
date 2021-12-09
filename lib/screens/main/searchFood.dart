import 'dart:io';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/foodMenu_controller.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/painting.dart' as painting;

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  FoodMenuController _foodMenuController = Get.put(FoodMenuController());
  bool _loading = true;
  File? _image;
  List? _output = [];
  final _picker = ImagePicker();

  Future clearCache() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    final directory = await getTemporaryDirectory();
    directory.delete(recursive: true);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('path ${path}');
    return File('$path');
    // return File('$path/counter.txt');
  }

  Future<int> deleteFile() async {
    // /data/user/0/com.example.elder_eate/cache/
    try {
      final file = await _localFile;
      print(file);
      // await file.delete();
      return 1;
    } catch (e) {
      return 0;
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await _picker.pickImage(source: source);
      if (image == null) return null;

      setState(() {
        _image = File(image.path);
      });

      detectImage(_image!);
      print(image.path);
    } on PlatformException catch (e) {
      print('Fail to pick image $e');
    }
  }

  Future detectImage(File image) async {
    final output = await Tflite.runModelOnImage(
      path: image.path, numResults: 10, threshold: 0.7,
      // threshold: 0.0025,
      // threshold: 0.001,
      imageMean: 117,
      imageStd: 1,
    );

    setState(() {
      _output = output;
      _loading = false;
    });

    // if (_output!.length != 0) {
    //   final resp =
    //       await SqlService.instance.foodLoadId(_output![0]['index'] + 1);
    //   if (resp.length != 0) {
    //     _foodMenuController.foodManu.value = resp[0];
    //     Get.to(() => FoodDetail(
    //           eventCheck: 0,
    //           fileimage: _image,
    //           foodImage: 'yes',
    //         ));
    //   }

    //   // print(resp[0]);
    //   // print(resp.toString());
    //   // inspect(resp);
    // } else {
    //   showAlert();
    // }

    print('output=======$_output');
  }

  Future loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model/TC_foods.tflite',
        labels: 'assets/model/TC_labels.txt'); // all food
    // model: 'assets/model/food.tflite',
    // labels: 'assets/model/labels.txt'); // furit

    print('load model');
  }

  showAlert() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'ไม่พบข้อมูล',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                'กรุณาลองใหม่อีกครั้งหรือพิพม์เพื่อค้นหา',
                textAlign: TextAlign.center,
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    // painting.imageCache!.clear();
    // clearCache();
    // deleteFile();
    // imageCache!.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: pHeaderTabColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: pHeaderTabColor,
            centerTitle: true,
            title: Text(
              'เพิ่มมื้ออาหาร',
              style: TextStyle(fontWeight: FontWeight.w700),

              // style: Theme.of(context).textTheme.headline1,
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
                        child: TypeAheadField<Map>(
                            textFieldConfiguration: TextFieldConfiguration(
                              decoration: InputDecoration(
                                hintText: 'ค้นหารายการอาหาร',
                                prefixIcon: Icon(Icons.search_rounded),
                                hintStyle: TextStyle(color: pRegisTxtColor),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                            suggestionsCallback: (patten) async {
                              return await SqlService.instance
                                  .foodSearch(patten);
                            },
                            itemBuilder: (context, suggestion) {
                              // final food = suggestion;
                              // print(suggestion!.name);
                              return ListTile(
                                title: Text(suggestion['Food_Name']),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              // Get.toNamed('/FoodDetail');
                              _foodMenuController.foodManu.value = suggestion;
                              Get.to(() => FoodDetail(
                                    eventCheck: 0,
                                    // foodImage: 'a',
                                  ));
                              // print(suggestion);
                            }))),
                SizedBox(
                  height: size.height * 0.25,
                ),
                GestureDetector(
                  onTap: () {
                    pickImage(ImageSource.camera);
                    // Navigator.pushNamed(context, '/Camera');
                  },
                  child: Container(
                    width: Adaptive.w(20),
                    height: 40.5.h,
                    child: CircleAvatar(
                        radius: size.width * 0.35,
                        backgroundColor: sBackgroundColor,
                        child: Icon(
                          Icons.camera_alt,
                          color: pHeaderTabColor,
                          size: 50,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ))));
  }
}
