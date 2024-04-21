import 'package:get/get.dart';

class AppInstaceController extends GetxController {
  String? domain;
  bool isLoading = false;

  updateloading(bool val) {
    isLoading = val;
    update();
  }

  updateDomain(String val) {
    domain = val;
    update();
  }
}
