import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_access_token_app/core/models/post/Content.dart';
import 'package:getx_access_token_app/modules/admin/post/repository/post_repository.dart';

import '../../../core/models/post/Content.dart';

class PostController extends GetxController {
  final PostRepository postRepository;
  PostController({required this.postRepository});

  final postList = <Content>[].obs;
  final loading = false.obs;

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future<void> getAllPosts() async {
    loading.value = true;
    var res = await postRepository.getAllPosts();
    if (res.isNotEmpty) {
      postList.value = res;
    }
    loading.value = false;
  }
}
