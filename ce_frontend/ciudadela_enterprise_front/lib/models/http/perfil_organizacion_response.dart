import 'dart:convert';
import 'package:ciudadela_enterprise_front/models/perfil_organizacion.dart';

class PerfilOrganizacionResponse {
    PerfilOrganizacion perfilOrganizacion;

    PerfilOrganizacionResponse({
        required this.perfilOrganizacion,
    });

    factory PerfilOrganizacionResponse.fromJson(String str) => PerfilOrganizacionResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PerfilOrganizacionResponse.fromMap(Map<String, dynamic> json) => PerfilOrganizacionResponse(
        
        perfilOrganizacion: PerfilOrganizacion.fromMap(json),
    );

    Map<String, dynamic> toMap() => {
        "perfil_organizacion": perfilOrganizacion.toMap(),
    };
}

