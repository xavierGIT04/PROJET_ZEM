class RegisterData {
  final String nom;
  final String prenom;
  final String password;
  final String role; // "PASSAGER" ou "CONDUCTEUR"
  final String? numeroPermis;
  final String? typeVehicule; // "ZEM" ou "TAXI"

  RegisterData({
    required this.nom,
    required this.prenom,
    required this.password,
    required this.role,
    this.numeroPermis,
    this.typeVehicule,
  });

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "password": password,
      "role": role,
      "numeroPermis": numeroPermis,
      "typeVehicule": typeVehicule,
    };
  }
}