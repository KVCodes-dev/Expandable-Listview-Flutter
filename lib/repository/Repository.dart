import 'package:exapandablelistviewblocarch/api_provider/httphelper.dart';
import 'package:exapandablelistviewblocarch/model/postmodel.dart';

class PostRespository {
  HttpHelper httpHelper = HttpHelper();

  Future<List<Post>> getPost() {
    return httpHelper.getPost();
  }
}
