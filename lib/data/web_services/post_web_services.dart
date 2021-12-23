import 'package:dio/dio.dart';
import 'package:kwg_softworks/constants/strings.dart';

class PostWebServices {
  late Dio dio;
  PostWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getPosts(int page) async {
    try {
      //get data from the internet and fetch limit data that will show
      Response response =
          await dio.get('comments' + ("?_limit=$fetchLimit&_page=$page"));
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
