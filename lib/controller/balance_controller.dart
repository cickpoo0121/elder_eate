import 'package:get/get.dart';

class NutritionBalanceController {
  // RxList<Map<String, List>> foodManu = [{'':[]}].obs;
  RxMap<String, List> calroies = {'': []}.obs;
  RxMap<String, List> sugar = {'': []}.obs;
  RxMap<String, List> sodium = {'': []}.obs;

  void toListMap(value, max) {
    calroies = {
      'calroies': [value[0], max[0]]
    } as RxMap<String, List>;
    sugar = {
      'sugar': [value[1], max[1]]
    } as RxMap<String, List>;
    sodium = {
      'sodium': [value[2], max[2]]
    } as RxMap<String, List>;

// for(int i =0;i<max.length;i++){
//     foodManu.add({'calroies':[value[i],[]]})
// }
  }
}
