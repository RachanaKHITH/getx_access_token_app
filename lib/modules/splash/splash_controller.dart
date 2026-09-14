import 'package:get/get.dart';
import 'package:getx_access_token_app/modules/home/home_view.dart';

import '../../routes/route_name.dart';
import '../../data/local/token_storage.dart';

class SplashController extends GetxController {
  var loading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    _checkToken();
    super.onInit();
  }

  void _checkToken() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 3));
    loading.value = false;
    if (TokenStorage.getToken().isEmpty) {
      Get.offNamed(RouteName.login);
    } else {
      Get.offNamed(RouteName.home);
    }
  }
}
