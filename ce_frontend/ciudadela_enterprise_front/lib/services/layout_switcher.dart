import 'package:ciudadela_enterprise_front/ui/layouts/custom_scaffold.dart';
import 'package:flutter/material.dart';

class LayoutSwitcher{
  Widget usePrincipalLayout(Widget widget){
    return PrincipalLayout(child: widget);
  }
}