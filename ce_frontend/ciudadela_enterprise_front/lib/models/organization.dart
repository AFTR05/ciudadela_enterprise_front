
import 'dart:convert';

class Organization {
    String nombreOrganizacion;

    Organization({
        required this.nombreOrganizacion,
    });

    factory Organization.fromJson(String str) => Organization.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Organization.fromMap(Map<String, dynamic> json) => Organization(
        nombreOrganizacion: json["nombre_organizacion"],
    );

    Map<String, dynamic> toMap() => {
        "nombre_organizacion": nombreOrganizacion,
    };
}
