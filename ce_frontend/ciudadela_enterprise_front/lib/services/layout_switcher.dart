import 'package:ciudadela_enterprise_front/ui/layouts/principal_layout.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class LayoutSwitcher{
  Widget useSimpleLayout(Widget widget){
    return PrincipalLayout(topBar: TopBar().basicTop(),child: widget);
  }

  Widget useNavigationEnterpriseLayout(Widget widget){
    return PrincipalLayout(topBar: TopBar().enterpriseMain(true),child: widget);
  }

  Widget useSimpleEnterpriseLayout(Widget widget){
    return PrincipalLayout(topBar: TopBar().enterpriseMain(false),child: widget);
  }
  
}