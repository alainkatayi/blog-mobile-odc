import 'package:app/business/models/Authentification.dart';
import 'package:app/business/models/user.dart';

import '../models/article.dart';

abstract class BlogNetworkService {
  Future<User> authentifier(Authentification data);
  Future<List<Article>> recupererArticle();
  Future<void> liker( int articleid);
}