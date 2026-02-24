import 'package:flutter/material.dart';
// Vérifie bien que le chemin remonte correctement vers ton fichier de constantes
import '../../core/constants/app_colors.dart'; 

class BoutonPersonnalise extends StatelessWidget {
  final String texte;
  final VoidCallback surAppui;

  const BoutonPersonnalise({super.key, required this.texte, required this.surAppui});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Cette ligne ne sera plus rouge une fois app_colors.dart créé
        backgroundColor: AppColors.primaryYellow, 
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: surAppui,
      child: Text(
        texte,
        style: const TextStyle(
          color: Colors.black, 
          fontWeight: FontWeight.bold, 
          fontSize: 16
        ),
      ),
    );
  }
}