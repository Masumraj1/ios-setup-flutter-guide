import '../entities/post_entity.dart';

abstract class HomeRepository {
  Future<List<PostEntity>> getPosts();
}
