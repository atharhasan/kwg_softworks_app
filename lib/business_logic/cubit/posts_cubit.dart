import 'package:bloc/bloc.dart';
import 'package:kwg_softworks/data/models/posts.dart';
import 'package:kwg_softworks/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.postRepository) : super(PostsInitial());

  int page = 1;
  final PostRepository postRepository;

  void loadPosts() async {
    if (state is PostsLoading) return;
    final currentState = state;

    var oldPosts = <Posts>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }
    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    // to fetch new posts after loading
    postRepository.fetchPosts(page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);
      emit(PostsLoaded(posts));
    });
  }
}
