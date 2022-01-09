import 'package:flutter/material.dart';
import 'package:blizzard_demo/screens/contact_screen.dart';

void main() {
  runApp(const BlizzardDemo());
}

class BlizzardDemo extends StatelessWidget {
  const BlizzardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactScreen(),
    );
  }
}
