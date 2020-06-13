import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ui_challenge/views/menu_view.dart';

import 'home_screen.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuView(drawerController: _drawerController,),
      mainScreen: HomeScreen(drawerController: _drawerController),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.grey[300],
      slideWidth: MediaQuery.of(context).size.width*.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInBack,
    );
  }
}