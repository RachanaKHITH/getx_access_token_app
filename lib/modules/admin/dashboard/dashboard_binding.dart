import 'package:get/get.dart';
import 'package:getx_access_token_app/modules/admin/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
  }
}
