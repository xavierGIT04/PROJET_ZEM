enum Role { passager, conducteur, regulateur }

class Utilisateur {
  final String id;
  final String nomComplet;
  final String telephone;
  final Role role;
  final bool kycValide;

  Utilisateur({
    required this.id,
    required this.nomComplet,
    required this.telephone,
    required this.role,
    this.kycValide = false,
  });
}