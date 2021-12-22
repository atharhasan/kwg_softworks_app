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

  //to launch web site url when clicking icon.
  void _launchURL() async {
    if (await launch(url)) throw 'could not launch $url';
  }

  //call BlocProvider to active it.
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).getPosts();
  }

  Widget buildListWidget() {
    return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
      if (state is PostsLoaded) {
        posts = (state).posts;
        return buildedList();
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.blueApp,
        ));
      }
    });
  }

  Widget buildedList() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return PostItem(posts: posts[index]);
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
