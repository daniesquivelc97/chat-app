import 'package:chat_app/global/evironment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  late Usuario usuarioRecibe;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final url = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID');
    final resp = await http.get(
      url,
      headers: {
        'Content-type': 'application/json',
        'x-token': await AuthService.getToken(),
      },
    );
    final mensajesResp = mensajesResponseFromJson(resp.body);
    return mensajesResp.mensajes;
  }
}
