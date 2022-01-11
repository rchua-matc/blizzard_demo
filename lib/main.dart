import 'package:flutter/material.dart';
import 'package:blizzard_demo/screens/contact_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const BlizzardDemo());
}

class BlizzardDemo extends StatelessWidget {
  const BlizzardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      home: ContactScreen(),
      theme: const NeumorphicThemeData(
        baseColor: Color(0xff333333),
        accentColor: Colors.green,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.3,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
