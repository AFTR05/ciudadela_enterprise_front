import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
class EnterpriseCard extends StatelessWidget {

  final String title;
  final Widget child;
  final IconData icon;
  final double? width;
  final double? height;

  const EnterpriseCard({super.key, required this.title, required this.child, this.width, this.height, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width!=null) ? width : null,
      height: (height!=null) ? height : null,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 35,),
          const SizedBox(height: 15,),
          Text(title,style: CustomLabels.tab18W400White),
          title.length < 40? const SizedBox(height: 60) : title.length > 52 ? const SizedBox(height: 18) : const SizedBox(height: 34),
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: const Color.fromRGBO(55, 57, 63,1),
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );
}