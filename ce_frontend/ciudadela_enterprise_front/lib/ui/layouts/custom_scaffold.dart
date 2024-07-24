import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/widgets/link_bar.dart';
import 'package:flutter/material.dart';

class PrincipalLayout extends StatelessWidget {
  final Widget child;

  PrincipalLayout({super.key, required this.child});

  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100.0,
            color: const Color.fromRGBO(55, 57, 63, 1),
            child: Center(
              child: Text(
                'Enterprise',
                style: CustomLabels.enterpriseTitle,
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  child,
                ],
              ),
            ),
          ),
          const LinkBar(),
        ],
      ),
    );
  }
}
