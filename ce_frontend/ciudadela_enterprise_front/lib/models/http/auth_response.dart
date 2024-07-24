import 'dart:convert';

import 'package:ciudadela_enterprise_front/models/auth_user.dart';

class AuthResponse {
    AuthUser usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token
    });

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: AuthUser.fromMap(json["usuario"]),
        token: json["data"]["token"]
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token
    };
}

