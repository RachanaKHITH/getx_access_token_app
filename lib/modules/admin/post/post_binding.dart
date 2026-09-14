import 'package:get/get.dart';
import 'package:getx_access_token_app/core/network/remote/api_service.dart';
import 'package:getx_access_token_app/modules/admin/post/post_controller.dart';
import 'package:getx_access_token_app/modules/admin/post/repository/post_repository.dart';
import 'package:getx_access_token_app/modules/admin/post/repository/post_repository_impl.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(
      () => PostRepositoryImpl(apiService: Get.find<ApiService>()),
    );
    Get.lazyPut(
      () => PostController(postRepository: Get.find<PostRepository>()),
    );
  }
}
