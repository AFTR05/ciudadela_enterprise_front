import 'dart:convert';
import 'package:ciudadela_enterprise_front/models/organization.dart';

class OrganizationResponse {
    Organization organizacion;

    OrganizationResponse({
        required this.organizacion,
    });

    factory OrganizationResponse.fromJson(String str) => OrganizationResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrganizationResponse.fromMap(Map<String, dynamic> json) => OrganizationResponse(
        
        organizacion: Organization.fromMap(json["organizacion"]),
    );

    Map<String, dynamic> toMap() => {
        "organizacion": organizacion.toMap(),
    };
}

