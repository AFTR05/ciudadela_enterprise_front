
import 'package:ciudadela_enterprise_front/ui/layouts/widgets/link_bar.dart';
import 'package:flutter/material.dart';

class PrincipalLayout extends StatelessWidget {
  final Widget child;
  final Widget topBar;

  PrincipalLayout({super.key, required this.child, required this.topBar});

  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: (size.width>1000)?size.height * 0.1:null,  
            color: const Color.fromRGBO(55, 57, 63, 1),
            child: Center(
              child: topBar,
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
