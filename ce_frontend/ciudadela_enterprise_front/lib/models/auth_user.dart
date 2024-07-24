import 'dart:convert';

class AuthUser {
    String firstName;
    String firstLastname;
    String email;
    String? accountName;

    AuthUser({
        required this.firstName,
        required this.firstLastname,
        required this.email,
        this.accountName,
    });

    factory AuthUser.fromJson(String str) => AuthUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthUser.fromMap(Map<String, dynamic> json) => AuthUser(
        firstName: json["primer_nombre"],
        firstLastname: json["primer_apellido"]?? "",
        email: json["correo_electronico"]?? "",
        accountName: json["nombre_cuenta"] ?? "",
    );

    Map<String, dynamic> toMap() => {
        "primer_nombre": firstName,
        "primer_apellido": firstLastname,
        "correo_electronico": email,
        "nombre_cuenta": accountName,
    };
}