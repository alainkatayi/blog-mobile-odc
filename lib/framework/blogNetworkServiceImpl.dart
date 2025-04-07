import 'dart:convert';

import 'package:app/business/models/Authentification.dart';
import 'package:app/business/models/user.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../business/models/article.dart';
class BlogNetworkServiceImpl implements BlogNetworkService{
  @override
  Future<User> authentifier(Authentification data) async {

    var url = Uri.parse("http://10.252.252.46:8000/api/login");
    var body = jsonEncode(data.toJson());
    var response = await http.post(
        url ,
        body: body,
        headers: {"content-type": "application/json"}

    );

    print(response.statusCode);
    var codes = [200, 201];
    var resultat = jsonDecode(response.body) as Map;

    if (!codes.contains(response.statusCode)) {
      var error = resultat["error"];
      throw Exception(error);
    }
    var user = User.fromMap(resultat);
    return user;
  }
  @override
  Future<List<Article>> recupererArticle() async {
    var url = Uri.parse("http://10.252.252.41:8000/api/articles");
    var response = await http.get(url);
    print("Réponse brute de l'API : ${response.body}");


    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
     // List<dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> articleData = jsonResponse['data'];
      return articleData.map((article) => Article.fromMap(article)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des articles");
    }
  }

  @override
  Future<void> liker(int articleid) async {
    var url = Uri.parse("http://10.252.252.19:8000/api/getAllArticles");
    var response = await http.get(url);
    print("Réponse brute de l'API : ${response.body}");



    // TODO: implement liker
    throw UnimplementedError();
  }

  static const String baseUrl = "http://10.252.252.19:8000/api";
  @override
  Future<List<Article>> recupere() async {
    final response = await http.get(Uri.parse('$baseUrl/articles'));
    if (response.statusCode ==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("echec");
    }
  }






}

/*void main() async{
  var formulaire = Authentification(
      email: "test@gmail.com",
      password: "123456"
  );

  var service = BlogNetworkServiceImpl();
  var user = await service.authentifier(formulaire);
  print(user.name);
}*/
/*void main() async{
  // var formulaire = Authentication(email: "ephraimmonga5@gmail.com", password: "123456");
  var service =  BlogNetworkServiceImpl();
  var user = await service.liker(1);
  print(user);
}*/