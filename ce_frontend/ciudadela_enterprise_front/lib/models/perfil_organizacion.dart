
import 'dart:convert';

class PerfilOrganizacion {
    String idOrganizacion;

    PerfilOrganizacion({
        required this.idOrganizacion,
    });

    factory PerfilOrganizacion.fromJson(String str) => PerfilOrganizacion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PerfilOrganizacion.fromMap(Map<String, dynamic> json) => PerfilOrganizacion(
        idOrganizacion: json["id_organizacion"],
    );

    Map<String, dynamic> toMap() => {
        "id_organizacion": idOrganizacion,
    };
}
