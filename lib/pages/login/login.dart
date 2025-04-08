import 'package:app/business/models/Authentification.dart';
import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/login/loginControl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  var emaiCtrl = TextEditingController(text: "ggig19@gmail.com");
  var passwordCtrl = TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(loginControlPorvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),

            CircleAvatar(
              radius: 50, // Taille de l'avatar
              backgroundColor: Colors.blue, // Couleur de fond
              child: Icon(Icons.person, size: 30, color: Colors.white),
            ),

            SizedBox(height: 50),

            SizedBox(
              height: 80,
              width: 400,
              child: TextField(
                controller: emaiCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 50),

            SizedBox(
              height: 80,
              width: 400,
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Mot de passe",
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var ctrl = ref.read(loginControlPorvider.notifier);
                var data = Authentification(
                  email: emaiCtrl.text,
                  password: passwordCtrl.text,
                );
                var res = await ctrl.submitForm(data);
                if (res) {
                  // navigation vers article list
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ListarticlePage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Couleur du bouton
                foregroundColor: Colors.white, // Couleur du texte
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bords arrondis
                ),
              ),
              child: Text(
                state.isLoading == true ? "Chargement..." : "Se connecter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
