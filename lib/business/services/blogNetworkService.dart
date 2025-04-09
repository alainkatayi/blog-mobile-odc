import 'package:app/business/models/Authentification.dart';
import 'package:app/business/models/user.dart';

import '../models/CreationCompte.dart';
import '../models/article.dart';

abstract class BlogNetworkService {
  Future<User> authentifier(Authentification data);
  Future<List<Article>> recupererArticle();
  Future<User> creerCompte(CreationCompte donnee);
  Future<void> liker( int articleid);
}