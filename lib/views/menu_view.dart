import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuView extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const MenuView({Key key, this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
          child: InkWell(
        onTap:  drawerController.close,
            child: Container(
          // child: child,
        ),
      ),
    );
  }
}