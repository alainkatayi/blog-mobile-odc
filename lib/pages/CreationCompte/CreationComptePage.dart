import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/models/CreationCompte.dart';
import 'CreationCompteCtrl.dart';


class CreationComptePage extends ConsumerStatefulWidget {
  const CreationComptePage({super.key});

  @override
  ConsumerState<CreationComptePage> createState() => _CreationComptePage();
}

class _CreationComptePage extends ConsumerState<CreationComptePage> {

  final name = TextEditingController(text: "ODC");
  final emailController = TextEditingController(text: "odc7@gmail.com");
  final passwordController = TextEditingController(text: "123456");
  final password_confirmation = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {

    var state = ref.watch(CreerCompteCtrlProvider);

    ref.listen(CreerCompteCtrlProvider, (prev, next) {
      print("error message ${next.errorMsg}");
      if (next.errorMsg != null && next.errorMsg !="") {
        print("SUCCESS error message ${next.errorMsg}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMsg??""), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Créer un compte",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: password_confirmation,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      var controller = ref.read(
                        CreerCompteCtrlProvider.notifier,
                      );
                      var data = CreationCompte(
                        name: name.text,
                        password: passwordController.text,
                        password_confirmation: password_confirmation.text,
                        email: emailController.text,
                      );

                      var res = await controller.soumettreFormulaire(data);
                      if (res) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("creation reussie"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: Text("Soumettre"),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
