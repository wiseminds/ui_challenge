import 'package:flutter/material.dart';
import 'package:ui_challenge/views/home_screen.dart';

import 'widgets/app_theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ui Challenge',
      theme: AppTheme.light,
      home: HomeScreen(),
    );
  }
}