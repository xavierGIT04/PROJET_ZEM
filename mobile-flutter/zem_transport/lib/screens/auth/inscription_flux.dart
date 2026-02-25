import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import '../../core/constants/app_colors.dart';

class InscriptionFlux extends StatefulWidget {
  const InscriptionFlux({super.key});

  @override
  State<InscriptionFlux> createState() => _InscriptionFluxState();
}

class _InscriptionFluxState extends State<InscriptionFlux> {
  int _etape = 1;
  String _roleChoisi = "PASSAGER"; // PASSAGER ou CONDUCTEUR

  @override
  Widget build(BuildContext context) {
    // Dynamique : 3 étapes pour passager, 5 pour conducteur
    int totalEtapes = _roleChoisi == "CONDUCTEUR" ? 5 : 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription $_etape/$totalEtapes"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Barre de progression visuelle
            LinearProgressIndicator(
              value: _etape / totalEtapes,
              backgroundColor: AppColors.grisBordure,
              color: AppColors.primaryYellow,
            ),
            const SizedBox(height: 30),
            Expanded(child: _buildEtapeContent()),
            const SizedBox(height: 20),
            BoutonPill(
              texte: _etape == totalEtapes ? "S'INSCRIRE" : "CONTINUER",
              action: () {
                if (_etape < totalEtapes) {
                  setState(() => _etape++);
                } else {
                  // Ici on lancera la simulation API plus tard
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Inscription réussie (Simulation)")),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEtapeContent() {
    switch (_etape) {
      case 1: return _stepPhone();
      case 2: return _stepOTP();
      case 3: return _stepBaseInfo();
      case 4: return _stepDriverInfo(); // Spécifique conducteur
      case 5: return _stepPhotos();     // Spécifique conducteur (KYC)
      default: return const SizedBox();
    }
  }

  // --- ÉTAPE 1 : TÉLÉPHONE ---
  Widget _stepPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Bienvenue !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("Entrez votre numéro pour commencer."),
        SizedBox(height: 30),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: "Téléphone", prefixText: "+228 "),
        ),
      ],
    );
  }

  // --- ÉTAPE 2 : OTP ---
  Widget _stepOTP() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Vérification", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Entrez le code à 4 chiffres envoyé par SMS."),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 200,
              child: TextField(
                maxLength: 4, // On limite à 4 chiffres pour le backend
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 20),
                decoration: InputDecoration(
                  counterText: "", // On cache le compteur de caractères
                  hintText: "0000",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
            ),
          ),
        ],
      );
    }
  // --- ÉTAPE 3 : INFOS DE BASE & RÔLE ---
  Widget _stepBaseInfo() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TextField(decoration: InputDecoration(labelText: "Prénom")),
          const SizedBox(height: 15),
          const TextField(decoration: InputDecoration(labelText: "Nom")),
          const SizedBox(height: 15),
          const TextField(decoration: InputDecoration(labelText: "Mot de passe"), obscureText: true),
          const SizedBox(height: 25),
          DropdownButtonFormField<String>(
            value: _roleChoisi,
            decoration: const InputDecoration(labelText: "Vous êtes ?"),
            items: const [
              DropdownMenuItem(value: "PASSAGER", child: Text("Passager")),
              DropdownMenuItem(value: "CONDUCTEUR", child: Text("Conducteur (Zem/Taxi)")),
            ],
            onChanged: (val) => setState(() => _roleChoisi = val!),
          ),
        ],
      ),
    );
  }

  // --- ÉTAPE 4 : INFOS CONDUCTEUR (Spec Backend) ---
  Widget _stepDriverInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Détails du véhicule", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const TextField(decoration: InputDecoration(labelText: "Numéro de Permis de conduire")),
        const SizedBox(height: 20),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: "Type de véhicule"),
          items: const [
            DropdownMenuItem(value: "ZEM", child: Text("Zemidjan (Moto)")),
            DropdownMenuItem(value: "TAXI", child: Text("Taxi Ville")),
          ],
          onChanged: (val) {},
        ),
      ],
    );
  }

  // --- ÉTAPE 5 : PHOTOS KYC (Spec Backend) ---
  Widget _stepPhotos() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Documents (KYC)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Prenez des photos nettes pour validation par le régulateur."),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _photoCard("Photo Profil", Icons.camera_alt),
              _photoCard("Photo Permis", Icons.card_membership),
              _photoCard("Photo Plaque", Icons.vignette),
              _photoCard("Photo CNI", Icons.badge),
              _photoCard("Photo Véhicule", Icons.directions_bike),
            ],
          ),
        ],
      ),
    );
  }

  Widget _photoCard(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grisBordure),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: AppColors.primaryYellow),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const Icon(Icons.add_circle, size: 18, color: Colors.green),
        ],
      ),
    );
  }
}