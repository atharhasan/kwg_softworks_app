import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwg_softworks/business_logic/cubit/posts_cubit.dart';
import 'package:kwg_softworks/constants/colors.dart';
import 'package:kwg_softworks/constants/strings.dart';
import 'package:kwg_softworks/data/models/posts.dart';
import 'package:kwg_softworks/presentation/widgets/post_item.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late List<Posts> posts;
  final scrollController = ScrollController();
  bool isLoading = false;

  //to launch web site url when clicking icon.
  void _launchURL() async {
    if (await launch(url)) throw 'could not launch $url';
  }

  // to set scroll controller to add listener that allows to load more pages.
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  //call BlocProvider to active it.
  @override
  void initState() {
    super.initState();
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();
  }

  Widget buildListWidget() {
    return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
      if (state is PostsLoading && state.isFirstFetch) {
        return progressIndicator();
      }
      if (state is PostsLoading) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is PostsLoaded) {
        posts = state.posts;
      }
      return buildedList();
    });
  }

  Widget progressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: CircularProgressIndicator(
        color: AppColors.blueApp,
      )),
    );
  }

  Widget buildedList() {
    return ListView.builder(
        controller: scrollController,
        itemCount: posts.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < posts.length) {
            return PostItem(posts: posts[index]);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
            return progressIndicator();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontSize: 25, color: AppColors.lightGrayApp),
        ),
        centerTitle: true,
        backgroundColor: AppColors.blueApp,
        actions: [
          IconButton(
            onPressed: _launchURL,
            icon: const Icon(Icons.launch_rounded),
            iconSize: 25,
          ),
        ],
      ),
      body: buildListWidget(),
    );
  }
}
