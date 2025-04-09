
import 'dart:convert';

CreationCompte creationCompteStateFromMap(String str) => CreationCompte.fromMap(json.decode(str));

String creationCompteStateToMap(CreationCompte data) => json.encode(data.toMap());

class CreationCompte {
  String name;
  String email;
  String password;
  String password_confirmation;

  CreationCompte({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation
  });

  CreationCompte copyWith({
    String? name,
    String? email,
    String? password,
    String? password_confirmation

  }) =>
      CreationCompte(
          name: name ?? this.name,
          email: email ?? this.email,
          password: password ?? this.password,
          password_confirmation:password_confirmation?? this.password_confirmation

      );

  factory CreationCompte.fromMap(Map<String, dynamic> json) => CreationCompte(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      password_confirmation:json["password_confirmation"]
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation":password_confirmation

  };
}
