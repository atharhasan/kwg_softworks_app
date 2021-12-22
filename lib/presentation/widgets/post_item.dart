import 'package:flutter/material.dart';
import 'package:kwg_softworks/constants/colors.dart';
import 'package:kwg_softworks/data/models/posts.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.posts}) : super(key: key);
  final Posts posts;

  //text widget
  Widget customText(String txt, Color color) {
    return Text(
      txt,
      style: TextStyle(fontSize: 15, color: color),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, top: 12, right: 15, bottom: 12),
      elevation: 10.0,
      shadowColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customText(posts.name, AppColors.blueApp),
            customText(posts.email, Colors.blueAccent.shade100),
            customText(posts.body, Colors.black54),
          ],
        ),
      ),
    );
  }
}
