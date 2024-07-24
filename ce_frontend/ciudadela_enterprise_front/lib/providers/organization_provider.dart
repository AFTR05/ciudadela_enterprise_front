import 'package:ciudadela_enterprise_front/api/ce_api.dart';
import 'package:ciudadela_enterprise_front/models/http/organizations_response.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:flutter/foundation.dart';
import 'package:ciudadela_enterprise_front/models/organization.dart';

class OrganizationProvider extends ChangeNotifier {
  Organization? organization;

  createOrganization(String name, String description, String email) {
    final data={
      "cuenta":{
        "correo_electronico": email
      },
      "organizacion":{
        "descripcion_organizacion":description,
        "nombre_organizacion":name
      }
    };
    CEApi.post('habilitacion/crear-organizacion/crear-organizacion-en-ce',data).then(
      (json) {
        final organizationResponse = OrganizationResponse.fromMap(json);
        organization = organizationResponse.organizacion;
        NavigationService.replaceTo(Flurorouter.organizationProfileRoute);
        NotificationsService.showSnackbar("Organización creada con exitoso");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.creationChannelRoute);
      NotificationsService.showSnackbarError('Nombre no valido');
    });
  }
}