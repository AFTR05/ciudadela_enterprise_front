import 'package:ciudadela_enterprise_front/router/auth_handlers.dart';
import 'package:ciudadela_enterprise_front/router/channel_handlers.dart';
import 'package:ciudadela_enterprise_front/router/no_page_found_handlers.dart';
import 'package:ciudadela_enterprise_front/router/organization_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static String rootRoute = '/';
  static String loginRoute = '/autenticarse';
  static String signUpRoute = '/crearcuentausuario';
  static String channelRoute = '/organizacion';
  static String creationChannelRoute = '/organizacion/crear-organizacion';
  static String organizationProfileRoute = '/perfil-organizacion';
  static String creationOrganization = '/perfil-organizacion/crear';

  static void configureRoutes(){
    // Auth Handler
    router.define(rootRoute, handler: AuthHandlers.login,transitionType: TransitionType.none);
    router.define(loginRoute, handler: AuthHandlers.login,transitionType: TransitionType.none);
    router.define(signUpRoute, handler: AuthHandlers.signUp,transitionType: TransitionType.none);

    // channel
    router.define(channelRoute, handler: ChannelHandlers.channel,transitionType: TransitionType.none);
    router.define(creationChannelRoute, handler: ChannelHandlers.channelCreation,transitionType: TransitionType.none);

    //organization profile
    router.define(organizationProfileRoute, handler: OrganizationHandlers.mainOrganizationProfile,
      transitionType: TransitionType.none
    );
    router.define(creationOrganization, handler: OrganizationHandlers.creationOrganization,
      transitionType: TransitionType.none
    );

    //no page found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }

}