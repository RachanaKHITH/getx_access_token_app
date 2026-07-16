import 'package:get/get.dart';
import 'package:getx_access_token_app/modules/home/home_view.dart';

import '../../constants/constant_route.dart';
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
      Get.offNamed(ConstantRoute.login);
    } else {
      Get.offNamed(ConstantRoute.home);
    }
  }
}
