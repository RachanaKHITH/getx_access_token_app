import 'package:getx_access_token_app/core/models/post/Content.dart';

abstract class PostRepository {
  Future<List<Content>> getAllPosts({
    String? page,
    String? limit,
    String? status,
  });
}
