import 'package:get/get.dart';
import 'package:getx_access_token_app/core/network/remote/api_service.dart';
import 'package:getx_access_token_app/core/network/remote/api_service_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiServiceImpl(), fenix: true);
  }
}
