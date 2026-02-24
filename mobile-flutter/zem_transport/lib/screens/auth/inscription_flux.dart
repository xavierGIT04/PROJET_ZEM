import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import '../../core/constants/app_colors.dart';

class InscriptionFlux extends StatefulWidget {
  const InscriptionFlux({super.key});

  @override
  State<InscriptionFlux> createState() => _InscriptionFluxState();
}

class _InscriptionFluxState extends State<InscriptionFlux> {
  int _etapeActuelle = 1;

  void _suivant() {
    setState(() {
      if (_etapeActuelle < 3) _etapeActuelle++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription $_etapeActuelle/3"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_etapeActuelle > 1) {
              setState(() => _etapeActuelle--);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _etapeActuelle / 3,
              backgroundColor: Colors.grey[200],
              color: AppColors.primaryYellow,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: _buildContenuEtape(),
            ),
            BoutonPill(
              texte: _etapeActuelle == 3 ? "Terminer" : "Continuer",
              action: _suivant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContenuEtape() {
    switch (_etapeActuelle) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Quel est votre numéro ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Nous vous enverrons un code de confirmation."),
            SizedBox(height: 30),
            TextField(decoration: InputDecoration(labelText: "Téléphone", prefixText: "+228 ")),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Vérification", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Entrez le code OTP reçu par SMS."),
            SizedBox(height: 30),
            TextField(decoration: InputDecoration(labelText: "Code OTP"), textAlign: TextAlign.center),
          ],
        );
      // ... (haut du fichier inchangé)
      case 3:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Profil & KYC", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Ces informations sont nécessaires pour la sécurité."),
              const SizedBox(height: 30),
              const TextField(decoration: InputDecoration(labelText: "Nom complet")),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Je suis un..."),
                items: const [
                  DropdownMenuItem(value: "P", child: Text("Passager")),
                  DropdownMenuItem(value: "C", child: Text("Conducteur")),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
        );
        default:
          return Container();
    }
  }
}