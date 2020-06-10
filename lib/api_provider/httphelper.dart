import 'dart:convert';

import 'package:exapandablelistviewblocarch/model/postmodel.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class HttpHelper {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPost() async {
    List<Post> post = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> map = json.decode(response.body);
        for (int i = 0; i < map.length; i++) {
          print(map[i]["title"]);
          post.add(Post.fromJson(map[i]));
        }
      }
    } catch (e) {
      print(e);
    }
    return post;
  }
}
