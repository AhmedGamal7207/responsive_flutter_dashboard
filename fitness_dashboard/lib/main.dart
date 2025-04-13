import 'package:fitness_dashboard/constant/constants.dart';
import 'package:fitness_dashboard/screens/main_screen.dart';
import 'package:fitness_dashboard/util/responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
      home:
          Responsive.isMobile(context)
              ? MainScreen()
              : SelectableRegion(
                focusNode: FocusNode(),
                selectionControls: materialTextSelectionControls,
                child: MainScreen(),
              ),
    );
  }
}
