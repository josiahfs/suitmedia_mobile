import 'package:get/get.dart';

class SelectedUserController extends GetxController {
  String? selectedUserName;

  void updateSelectedUserName(String? firstName, String? lastName) {
    selectedUserName = '$firstName $lastName';
    update(); // Trigger a rebuild of the GetBuilder/GetX widget
  }
}
