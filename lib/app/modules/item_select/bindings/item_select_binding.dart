import 'package:get/get.dart';

import '../controllers/item_select_controller.dart';

class ItemSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemSelectController>(
      () => ItemSelectController(),
    );
  }
}
