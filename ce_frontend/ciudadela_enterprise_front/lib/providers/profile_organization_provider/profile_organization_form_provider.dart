import 'package:ciudadela_enterprise_front/api/ce_api.dart';
import 'package:ciudadela_enterprise_front/models/http/perfil_organizacion_response.dart';
import 'package:ciudadela_enterprise_front/models/perfil_organizacion.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:flutter/material.dart';

class ProfileOrganizationProvider extends ChangeNotifier{
  PerfilOrganizacion? perfilOrganizacion;

  guardarInformacionGeneral(String email,String direccion,String telefono){
    final data={
      "informacion_general_organizacion": {
        "correo_electronico": email,
        "telefono_organizacion": telefono,
        "direccion_organizacion": direccion
      }
    };
    CEApi.post('caracterizacion/perfil-basico-organizacion/informacion-general',data).then(
      (json) {
        final perfilOrganizacionResponse = PerfilOrganizacionResponse.fromMap(json['informacion_general_organizacion']);
        perfilOrganizacion = perfilOrganizacionResponse.perfilOrganizacion;
        NotificationsService.showSnackbar("Informacion general de organizacion guardada con exito");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.creationOrganization);
      NotificationsService.showSnackbarError('Correo electronico / Telefono / Direccion no validos');
    });
  }

  guardarEstadoOrganizacion(
      bool puntoEquilibrioFinanciero,String estrategiaDeCumplimiento,String tiempoDeMeta,
      bool poseeRegistroMercantil,bool perfilOportunidadNegocioDisponible,String nombrePerfil,
      String correoPerfil,String telefonoPerfil
    ){
    final data={
      "estado_organizacion": {
        "punto_equilibrio_financiero": puntoEquilibrioFinanciero,
        estrategiaDeCumplimiento=="" || tiempoDeMeta==""
        ?null
        :"estrategia_punto_equilibrio": {"estrategia_de_cumplimiento": estrategiaDeCumplimiento,"tiempo_de_meta": tiempoDeMeta},
        "posee_registro_mercantil": poseeRegistroMercantil,
        "perfil_oportunidad_negocio_disponible": perfilOportunidadNegocioDisponible,
        nombrePerfil==""||correoPerfil==""||telefonoPerfil==""
        ?null
        :"perfil_oportunidad_negocio": {"nombre_perfil": nombrePerfil,"correo_perfil": correoPerfil,"telefono_perfil": telefonoPerfil}
        
    }
    };
    CEApi.post('caracterizacion/perfil-basico-organizacion/estado-organizacion',data).then(
      (json) {
        final perfilOrganizacionResponse = PerfilOrganizacionResponse.fromMap(json['estado-organizacion']);
        perfilOrganizacion = perfilOrganizacionResponse.perfilOrganizacion;
        NotificationsService.showSnackbar("Estado de organizacion guardada con exito");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.creationOrganization);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

  guardarParticipacionEcosistema(
    bool participacionFondoEmprender,bool participacionSennova,bool participacionAppsCo,
    bool participacionColombiaProductiva,bool participacionAldeaInnpulsa,String registraOtroPrograma,
    bool compraServiciosConsultoria,String temaConsultoria
  ){
    final data={
      "participacion_ecosistema":{
        "participacion_fondo_emprender": participacionFondoEmprender,
        "participacion_sennova": participacionSennova,
        "participacion_apps_co": participacionAppsCo,
        "participacion_colombia_productiva": participacionColombiaProductiva,
        "participacion_aldea_innpulsa": participacionAldeaInnpulsa,
        registraOtroPrograma==""?null
        :"registra_otro_programa": registraOtroPrograma,
        "compra_servicios_consultoria": compraServiciosConsultoria,
        temaConsultoria==""?null
        :"tema_consultoria": temaConsultoria
    }
    };
    CEApi.post('caracterizacion/perfil-basico-organizacion/participacion-ecosistema',data).then(
      (json) {
        final perfilOrganizacionResponse = PerfilOrganizacionResponse.fromMap(json['participacion_ecosistema']);
        perfilOrganizacion = perfilOrganizacionResponse.perfilOrganizacion;
        NotificationsService.showSnackbar("participacion de organizacion guardada con exito");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.creationOrganization);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }


  
}