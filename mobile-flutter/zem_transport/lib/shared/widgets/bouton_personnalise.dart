import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class BoutonPill extends StatelessWidget {
  final String texte;
  final VoidCallback action;

  const BoutonPill({super.key, required this.texte, required this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryYellow,
          foregroundColor: Colors.black,
          shape: const StadiumBorder(),
          elevation: 2,
        ),
        onPressed: action,
        child: Text(texte, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}