import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:kwg_softworks/data/models/posts.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  Future<dynamic> readPosts() async {
    final String response =
        await rootBundle.loadString("assets/files/api_file.json");
    List data = await json.decode(response);

    List<Posts> posts = List<Posts>.from(data.map((e) => Posts.fromJson(e)));
    return posts;
  }

  getPosts() {
    readPosts().then((posts) {
      emit(PostsLoaded(posts));
    });
  }
}
