import 'package:get/get.dart';
import 'package:getx_access_token_app/modules/admin/dashboard/models/menu_model.dart';

class DashboardController extends GetxController {
  var menuList = <MenuModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    menuList.value = MenuModel.getAllMenus();
    super.onInit();
  }

  void onClickMenu(String routeName) {
    Get.toNamed(routeName);
  }
}
