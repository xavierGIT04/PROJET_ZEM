import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import 'inscription_flux.dart';

class ConnexionEcran extends StatelessWidget {
  const ConnexionEcran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_bike, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              const Text("ZemExpress", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              const TextField(decoration: InputDecoration(labelText: "Numéro de téléphone", prefixText: "+228 ")),
              const SizedBox(height: 15),
              const TextField(decoration: InputDecoration(labelText: "Mot de passe"), obscureText: true),
              const SizedBox(height: 30),
              BoutonPill(texte: "Se connecter", action: () {}),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const InscriptionFlux())),
                child: const Text("Pas encore de compte ? S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}