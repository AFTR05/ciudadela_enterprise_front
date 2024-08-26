import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/services/layout_switcher.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/splash/splash_layout.dart';
import 'package:ciudadela_enterprise_front/ui/views/enterprise_own_modules_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/enterprise_own_valorations_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/enterprise_module_details_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/enterprise_resume_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/enterprise_shop_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/login_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/organization_profile_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class EnterpriseHandlers {
  static Handler enterpriseResume= Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useNavigationEnterpriseLayout(const EnterpriseResumeView(),0);  
      }
    }
  );

  static Handler enterpriseShop = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useNavigationEnterpriseLayout(const EnterpriseShopView(),1);  
      }
    }
  );

  static Handler enterpriseProfile = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useNavigationEnterpriseLayout(const OrganizationProfileView(),2);  
      }
    }
  );

  static Handler enterpriseOwnModules = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useSimpleEnterpriseLayout(const EnterpriseOwnModulesView());  
      }
    }
  );

  static Handler enterpriseOwnModulesDetails = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useSimpleEnterpriseLayout(const EnterpriseModuleDetailsView());  
      }
    }
  );

  static Handler enterpriseOwnValorations = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().useSimpleLayout(const LoginView());
      }else {
        return LayoutSwitcher().useSimpleEnterpriseLayout(const EnterpriseOwnValorationsView());  
      }
    }
  );
  
}