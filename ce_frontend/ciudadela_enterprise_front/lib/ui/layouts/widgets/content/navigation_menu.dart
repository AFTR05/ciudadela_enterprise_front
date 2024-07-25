import 'package:ciudadela_enterprise_front/ui/buttons/custom_enterprise_navigation_button.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedButton = 0;

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
          onPressed: () => _onButtonPressed(0),
          text: "Resumen",
          isSelected: _selectedButton == 0,
        ),
        CustomEnterpriseNavigationButton(
          onPressed: () => _onButtonPressed(1),
          text: "Tienda",
          isSelected: _selectedButton == 1,
        ),
        CustomEnterpriseNavigationButton(
          onPressed: () => _onButtonPressed(2),
          text: "Perfil",
          isSelected: _selectedButton == 2,
        ),
      ],
    );
  }
}