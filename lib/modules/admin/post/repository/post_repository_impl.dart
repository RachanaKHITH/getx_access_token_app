import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_access_token_app/constants/constant_uri.dart';
import 'package:getx_access_token_app/core/models/post/Content.dart';
import 'package:getx_access_token_app/core/models/post/PostResponse.dart';
import 'package:getx_access_token_app/core/network/remote/api_service.dart';
import 'package:getx_access_token_app/modules/admin/post/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;
  PostRepositoryImpl({required this.apiService});

  @override
  Future<List<Content>> getAllPosts({
    String? page,
    String? limit,
    String? status,
  }) async {
    var response = await apiService.get(
      "${ConstantUri.getAllPostPath}?page=${page ?? 0}&size=${limit ?? 100}&status=${status ?? "ACT"}",
    );
    if (response != null) {
      PostResponse postResponse = PostResponse.fromJson(jsonDecode(response));
      if (postResponse.data != null && postResponse.data!.content!.isNotEmpty) {
        return postResponse.data!.content ?? [];
      }
    }
    return [];
  }
}
