import 'package:app/pages/login/loginControl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    var state =ref.watch(loginControlPorvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [

                SizedBox(height: 100,),

                CircleAvatar(
                  radius: 50, // Taille de l'avatar
                  backgroundColor: Colors.blue, // Couleur de fond
                  child: Icon(Icons.person, size: 30, color: Colors.white),
                ),

                SizedBox(height: 50,),


                SizedBox(
                  height: 80,
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Email",
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold)

                    ),
                  ),
                ),
                SizedBox(height: 50,),


                SizedBox(
                  height: 80,
                  width: 400,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Mot de passe",
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var ctrl = ref.read(loginControlPorvider.notifier);
                    ctrl.submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Couleur du bouton
                    foregroundColor: Colors.white, // Couleur du texte
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bords arrondis
                    ),
                  ),
                  child: Text( state.isLoading==true? "Chargement...": "Se connecter"),
                )
              ],
          ),
      )

    );
  }
}
