import 'package:get/get.dart';

class GenderSelectionController extends GetxController {
  var selectionGender = "".obs;

  onChangedGender(var gender) {
    selectionGender.value = gender;
  }
}
