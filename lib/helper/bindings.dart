import 'package:ace/Controller/AuthController.dart';
import 'package:get/get.dart';

class bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
