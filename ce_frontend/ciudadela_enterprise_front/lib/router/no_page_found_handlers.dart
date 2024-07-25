import 'package:ciudadela_enterprise_front/services/layout_switcher.dart';
import 'package:ciudadela_enterprise_front/ui/views/no_page_found.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (context,params){
      return LayoutSwitcher().useSimpleLayout( const NoPageFoundView());
    });

  
}