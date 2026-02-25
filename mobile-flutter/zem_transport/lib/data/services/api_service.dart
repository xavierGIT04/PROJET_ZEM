import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Garde le vrai code en commentaire en dessous pour ton collègue
  Future<bool> register(dynamic data, Map<String, String> filePaths) async {
    print("DEMO : Simulation d'inscription en cours...");
    await Future.delayed(const Duration(seconds: 2)); // Simule l'attente réseau au Togo [cite: 19]
    return true; 
  }
}






/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../models/utilisateur.dart';

class ApiService {
  static const String baseUrl = "http://TON_IP_BACKEND:8080/api/v1";

  Future<bool> register(RegisterData data, Map<String, String> filePaths) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/auth/register'));

    // 1. La partie Texte (JSON dans la clé 'data')
    var jsonPart = http.MultipartFile.fromString(
      'data',
      jsonEncode(data.toJson()),
      contentType: MediaType('application/json', 'utf/8'),
    );
    request.files.add(jsonPart);

    // 2. La partie Fichiers
    for (var entry in filePaths.entries) {
      if (entry.value.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(entry.key, entry.value));
      }
    }

    var response = await request.send();
    return response.statusCode == 200 || response.statusCode == 201;
  }
}*/