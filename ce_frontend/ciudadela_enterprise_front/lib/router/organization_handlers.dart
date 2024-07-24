import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/custom_scaffold.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/splash/splash_layout.dart';
import 'package:ciudadela_enterprise_front/ui/views/login_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/creation_organization_profile_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization_begin_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class OrganizationHandlers {
  static Handler mainOrganizationProfile = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking )
        return SplashLayout();
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return PrincipalLayout(child: const LoginView());
      }else {
        return PrincipalLayout(child: const ProfileOrganizationBeginView());
      }
    }
  );

  static Handler creationOrganization = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking )
        return SplashLayout();
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return PrincipalLayout(child: const LoginView());
      }else {
        return PrincipalLayout(child: const CreationOrganizationProfileView());
      }
    }
  );
}



