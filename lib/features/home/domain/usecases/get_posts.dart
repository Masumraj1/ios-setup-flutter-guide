import '../repositories/home_repository.dart';
import '../entities/post_entity.dart';

class GetPosts {
  final HomeRepository repository;

  GetPosts(this.repository);

  Future<List<PostEntity>> call() {
    return repository.getPosts();
  }
}
