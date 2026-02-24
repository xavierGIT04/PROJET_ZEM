import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import 'verification_otp_ecran.dart';

class SaisieTelephoneEcran extends StatefulWidget {
  const SaisieTelephoneEcran({super.key});

  @override
  State<SaisieTelephoneEcran> createState() => _SaisieTelephoneEcranState();
}

class _SaisieTelephoneEcranState extends State<SaisieTelephoneEcran> {
  final _telController = TextEditingController();

  void _demanderCode() {
    if (_telController.text.length >= 8) {
      // Simulation de l'appel API mentionné par ton collègue
      // Le numéro est envoyé au backend ici
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationOtpEcran(numero: _telController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Entrez un numéro valide (Togo)")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Votre numéro ?", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Nous allons vous envoyer un code de vérification par SMS."),
            const SizedBox(height: 30),
            TextField(
              controller: _telController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Numéro de téléphone",
                prefixText: "+228 ",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            BoutonPersonnalise(texte: "Recevoir le code", surAppui: _demanderCode),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}