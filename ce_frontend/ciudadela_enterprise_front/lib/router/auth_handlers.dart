import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/services/layout_switcher.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/splash/splash_layout.dart';
import 'package:ciudadela_enterprise_front/ui/views/login_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/main_view.dart';
import 'package:ciudadela_enterprise_front/ui/views/sign_up_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AuthHandlers {
  static Handler login = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.checking ) {
        return SplashLayout();
      }
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().usePrincipalLayout(const LoginView());
      }else {
        return LayoutSwitcher().usePrincipalLayout(const MainView());
      }
    }
  );

  static Handler signUp = Handler(
    handlerFunc: (context,params){
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LayoutSwitcher().usePrincipalLayout(const SignUpView());        
      } else {
        return LayoutSwitcher().usePrincipalLayout(const MainView());       
      }

    }
  );
  
}