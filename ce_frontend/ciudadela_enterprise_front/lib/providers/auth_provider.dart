import 'package:ciudadela_enterprise_front/api/ce_api.dart';
import 'package:ciudadela_enterprise_front/models/auth_user.dart';
import 'package:ciudadela_enterprise_front/models/http/auth_response.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/services/shared_preference_mixin.dart';
import 'package:flutter/material.dart';
enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,

}

class AuthProvider with ChangeNotifier, SharedPreferencesMixin {
  String _token = '';
  AuthUser _user= AuthUser(firstName: '', firstLastname: '', email: '');
  AuthStatus _authStatus = AuthStatus.checking;

  String get token => _token;
  AuthUser get user => _user;
  AuthStatus get authStatus => _authStatus;

  AuthProvider() {
    isAuthenticated();
  }

  Future<void> login(String email, String password) async{
    final data={
      "cuenta": {
        "correo_electronico": email,
        "contrasena": password
      }
    };
    try {
      // final json = await CEApi.post('habilitacion/autenticarse/autenticarse-en-ce', data);
      Map<String, dynamic> json = {
        "status": "success",
        "usuario": {
          "primer_nombre": "Juan",
          "primer_apellido": "Pérez",
          "correo_electronico": "juan.perez@example.com"
        },
        "data": {
          "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
        }
      };

      final authResponse = AuthResponse.fromMap(json);
      _user = authResponse.usuario;
      _token = authResponse.token;
      _authStatus = AuthStatus.authenticated;
      await saveString('token', _token);
      await saveString('user', _user.toJson());
      NavigationService.replaceTo(Flurorouter.channelRoute);
      notifyListeners();
    } catch (e) {
      _authStatus = AuthStatus.notAuthenticated;
      NavigationService.replaceTo(Flurorouter.loginRoute);
      NotificationsService.showSnackbarError('Correo electronico / Contraseña no validos');
      notifyListeners();
    }
  }

  register(String name,String lastname,String userName,String email,String password){
    final Map<String, dynamic> data = _createUserData(name, lastname, userName, email, password);
    CEApi.post("habilitacion/crear-cuenta-de-usuario/crear-cuenta-de-usuario",data).then(
      (json){
        AuthUser.fromMap(json["usuario"]);
        NavigationService.replaceTo(Flurorouter.loginRoute);
        NotificationsService.showSnackbar("Registro exitoso");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.signUpRoute);
      NotificationsService.showSnackbarError('Email no valido');
    });
  }

  Map<String, dynamic> _createUserData(String name, String lastname, String userName, String email, String password) {
    final List nameList=name.split(' ');
    final List lastnameList=lastname.split(' ');
    return {
      "usuario": {
        "correo_electronico": email,
        "primer_nombre": nameList[0],
        if (nameList.length > 1 && nameList[1].isNotEmpty) "segundo_nombre": nameList[1],
        "primer_apellido": lastnameList[0],
        if (lastnameList.length > 1 && lastnameList[1].isNotEmpty) "segundo_apellido": lastnameList[1],
      },
      "cuenta": {
        "correo_electronico": email,
        "nombre_cuenta": userName,
        "contrasena": password,
      }
    };
  }


  void isAuthenticated() async{
    final prueba=await getString('user');
    await getString('token');
    _token = (await getString('token')) ?? '';
    if (_token.isNotEmpty) {
      String? userJson = await getString('user');
      if (userJson != null) {
        _user = AuthUser.fromJson(userJson);
        _authStatus = AuthStatus.authenticated;
      } else {
        _authStatus = AuthStatus.notAuthenticated;
      }
    } else {
      _authStatus = AuthStatus.notAuthenticated;
    }
    notifyListeners();
  }
}