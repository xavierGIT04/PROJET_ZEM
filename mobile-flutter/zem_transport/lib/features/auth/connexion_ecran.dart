import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import 'saisie_telephone_ecran.dart'; // Pour l'inscription

class ConnexionEcran extends StatefulWidget {
  const ConnexionEcran({super.key});

  @override
  State<ConnexionEcran> createState() => _ConnexionEcranState();
}

class _ConnexionEcranState extends State<ConnexionEcran> {
  final _telController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // On peut imaginer le logo du projet ici
            const Text("Bienvenue sur ZemExpress", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            
            TextField(
              controller: _telController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Numéro de téléphone",
                prefixText: "+228 ",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            
            BoutonPersonnalise(
              texte: "Se connecter", 
              surAppui: () {
                // Ici on appellera l'API login de ton pote
                print("Tentative de connexion...");
              }
            ),
            
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Vous n'avez pas de compte ?"),
                TextButton(
                  onPressed: () {
                    // On dirige vers le flux d'inscription que tu as validé
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SaisieTelephoneEcran()),
                    );
                  },
                  child: const Text("Inscrivez-vous", 
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}