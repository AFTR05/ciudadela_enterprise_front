  import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_enterprise_navigation_button.dart';
  import 'package:flutter/material.dart';

  class NavigationMenu extends StatefulWidget {

    final int defaultSelectedButton; 

  const NavigationMenu({super.key, required this.defaultSelectedButton}); 

    @override
    State<NavigationMenu> createState() => _NavigationMenuState();
  }

  class _NavigationMenuState extends State<NavigationMenu> {
    late int _selectedButton;

    @override
    void initState() {
      super.initState();
      _selectedButton = widget.defaultSelectedButton;
    }

    void _onButtonPressed(int selectedButton) {
      setState(() {
        _selectedButton = selectedButton;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Row(
        children: [
          CustomEnterpriseNavigationButton(
            onPressed: () {
              NavigationService.replaceTo(Flurorouter.enterpriseResume);
              
            },
            text: "Resumen",
            isSelected: _selectedButton == 0,
          ),
          CustomEnterpriseNavigationButton(
            onPressed: () {
              NavigationService.replaceTo(Flurorouter.enterpriseShop);
              
            },
            text: "Tienda",
            isSelected: _selectedButton == 1,
          ),
          CustomEnterpriseNavigationButton(
            onPressed: () {
              NavigationService.replaceTo(Flurorouter.enterpriseProfile);
              
            },
            text: "Perfil",
            isSelected: _selectedButton == 2,
          ),
        ],
      );
    }
  }