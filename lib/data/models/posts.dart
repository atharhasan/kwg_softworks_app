class Posts {
  late int postId;
  late int id;
  late String name;
  late String email;
  late String body;

  Posts.fromJson(Map<String, dynamic> json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}
