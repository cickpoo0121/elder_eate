import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/foodManu_controller.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  FoodManuController _foodManuController = Get.put(FoodManuController());
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
                              _foodManuController.foodManu.value = suggestion;
                              Get.to(() => FoodDetail(
                                    eventCheck: 0,
                                  ));
                              // print(suggestion);
                            }))),
                SizedBox(
                  height: size.height * 0.25,
                ),
                GestureDetector(
                  onTap: () {
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
