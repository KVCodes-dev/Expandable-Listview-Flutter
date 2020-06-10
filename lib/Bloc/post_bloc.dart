import 'package:exapandablelistviewblocarch/model/postmodel.dart';
import 'package:exapandablelistviewblocarch/repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  PostRespository postRespository = PostRespository();
  final BehaviorSubject<List<Post>> _post = BehaviorSubject<List<Post>>();

  getPost() async {
    List<Post> response = await postRespository.getPost();
    _post.sink.add(response);
  }

  dispose() {
    _post.close();
  }

  BehaviorSubject<List<Post>> get subject => _post;
}

final bloc = PostBloc();
