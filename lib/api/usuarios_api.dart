import 'dart:convert';

import 'package:userslist/models/usuario.dart';
import 'package:http/http.dart' as http;

class UsuariosApi {
  static Future<List<Usuario>> getUsuarios() async {
    const url =
        'https://raw.githubusercontent.com/esantos1/person-data-json/main/person-data.json';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<Usuario>((item) => Usuario.fromJson(item)).toList();
  }
}
