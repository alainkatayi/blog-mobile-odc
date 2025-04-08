class AjouterCommentaire {
  String? content;

  AjouterCommentaire({this.content});

  AjouterCommentaire copyWith({
    String? content,
  }) =>
      AjouterCommentaire(
        content: content ?? this.content,
      );

  factory AjouterCommentaire.fromMap(Map<String, dynamic> json) =>
      AjouterCommentaire(
        content: json['content'],
      );

  Map<String, dynamic> toMap() => {
        "content": content,
      };
}
