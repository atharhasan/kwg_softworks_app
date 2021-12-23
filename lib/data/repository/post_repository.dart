import 'package:kwg_softworks/data/models/posts.dart';
import 'package:kwg_softworks/data/web_services/post_web_services.dart';

class PostRepository {
  final PostWebServices postWebServices;

  PostRepository(this.postWebServices);

  Future<List<Posts>> fetchPosts(int page) async {
    final posts = await postWebServices.getPosts(page);
    return posts.map((e) => Posts.fromJson(e)).toList();
  }
}
