import 'package:flutter/material.dart';

import 'views/drawer.dart';
import 'widgets/app_theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ui Challenge',
      theme: AppTheme.light,
      home: DrawerView(),
    );
  }
}