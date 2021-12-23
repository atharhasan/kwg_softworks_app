import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwg_softworks/business_logic/cubit/posts_cubit.dart';
import 'package:kwg_softworks/constants/strings.dart';
import 'package:kwg_softworks/data/repository/post_repository.dart';
import 'package:kwg_softworks/data/web_services/post_web_services.dart';
import 'package:kwg_softworks/presentation/screens/home_screen.dart';
import 'package:kwg_softworks/presentation/screens/posts_screen.dart';

class AppRouter {
  late PostRepository postRepository;
  late PostsCubit postsCubit;
  AppRouter() {
    postRepository = PostRepository(PostWebServices());
    postsCubit = PostsCubit(postRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case postsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (BuildContext context) => postsCubit,
                  child: const PostsScreen(),
                ));
    }
  }
}
