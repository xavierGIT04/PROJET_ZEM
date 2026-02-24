import 'dart:async';
import 'package:flutter/material.dart';
import '../../shared/widgets/bouton_personnalise.dart';
import 'formulaire_inscription_ecran.dart';

class VerificationOtpEcran extends StatefulWidget {
  final String numero;
  const VerificationOtpEcran({super.key, required this.numero});

  @override
  State<VerificationOtpEcran> createState() => _VerificationOtpEcranState();
}

class _VerificationOtpEcranState extends State<VerificationOtpEcran> {
  int _secondesRestantes = 60;
  Timer? _timer;
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _demarrerChrono();
    // Popup demandé par le collègue du back pour afficher le code simulé
    Future.delayed(const Duration(seconds: 1), () => _afficherPopupCode());
  }

  void _demarrerChrono() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondesRestantes > 0) {
        setState(() => _secondesRestantes--);
      } else {
        _timer?.cancel();
      }
    });
  }

  void _afficherPopupCode() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("SMS Simulé"),
        content: const Text("Votre code de vérification ZemExpress est : 1234"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vérification du +228 ${widget.numero}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 4,
              style: const TextStyle(fontSize: 24, letterSpacing: 10),
              decoration: const InputDecoration(hintText: "0000"),
            ),
            const SizedBox(height: 10),
            Text("Renvoyer le code dans $_secondesRestantes s", style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            BoutonPersonnalise(
              texte: "Vérifier", 
              surAppui: () {
                if (_otpController.text == "1234") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulaireInscriptionEcran()));
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}