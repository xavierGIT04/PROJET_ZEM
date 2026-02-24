import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';

class FormulaireInscriptionEcran extends StatefulWidget {
  const FormulaireInscriptionEcran({super.key});

  @override
  State<FormulaireInscriptionEcran> createState() => _FormulaireInscriptionEcranState();
}

class _FormulaireInscriptionEcranState extends State<FormulaireInscriptionEcran> {
  String _roleChoisi = 'Passager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dernière étape")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Nom", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Prénom", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: "Mot de passe", border: OutlineInputBorder())),
            const SizedBox(height: 25),
            const Text("Vous êtes un :", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              title: const Text("Passager (Client)"),
              leading: Radio<String>(
                value: 'Passager',
                groupValue: _roleChoisi,
                onChanged: (v) => setState(() => _roleChoisi = v!),
              ),
            ),
            ListTile(
              title: const Text("Conducteur (Zém/Taxi)"),
              leading: Radio<String>(
                value: 'Conducteur',
                groupValue: _roleChoisi,
                onChanged: (v) => setState(() => _roleChoisi = v!),
              ),
            ),
            const SizedBox(height: 30),
            BoutonPersonnalise(
              texte: "Terminer l'inscription", 
              surAppui: () {
                // Ici on envoie tout au backend
                print("Inscription terminée en tant que $_roleChoisi");
              }
            ),
          ],
        ),
      ),
    );
  }
}