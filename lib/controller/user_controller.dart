import 'package:elder_eate/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // RxList<User> user;
  var user = <User>[].obs;

  void updateUser(String target, var value) {
    var userO = user[0];
    switch (target) {
      case 'username':
        userO.username = value;
        break;
      case 'age':
        userO.age = value;
        break;
      case 'sex':
        userO.sex = value;
        break;
      case 'weight':
        userO.weight = value;
        break;
      case 'height':
        userO.height = value;
        break;
      case 'disease':
        userO.disease = value;
        break;
      case 'line':
        userO.line = value;
        break;
    }
    userO.username = value;
  }
}
