import 'category.dart';

class Article {
  int? id;
  String? title;
  String? auteur;
  String? slug;
  String? photo;
  String? content;
  int? nbr_Comment;
  int? nb_Likes;
  List<Category>? category;
  List<dynamic>? tag;
  DateTime? datecreation;
  String? lastmodif;

  Article({
    this.id,
    this.title,
    this.slug,
    this.photo,
    this.content,
    this.nbr_Comment,
    this.nb_Likes,
    this.category,
    this.tag,
    this.datecreation,
    this.lastmodif,
  });


  factory Article.fromMap(Map<String, dynamic> json) => Article(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    photo: json["photo"],
    content: json["content"],
    nbr_Comment: json["nbr_comment"],
    nb_Likes: json["nb_likes"],
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromMap(x))),
    tag: json["tag"] == null ? [] : List<dynamic>.from(json["tag"]!.map((x) => x)),
    datecreation: json["datecreation"],
    lastmodif: json["lastmodif"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "slug": slug,
    "photo": photo,
    "content": content,
    "nbr_comment": nbr_Comment,
    "nb_likes": nb_Likes,
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toMap())),
    "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x)),
    "datecreation": datecreation,
    "lastmodif": lastmodif,
  };

}