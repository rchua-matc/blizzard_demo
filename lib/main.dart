import 'package:blizzard_demo/screens/contact_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// Runs the Blizzard Demo.
void main() {
  runApp(const BlizzardDemo());
}

/// The Blizzard Demo app.
///
/// Consists of three screens: (1) a screen with the author's contact
/// information, (2) a screen with a color picker and (3) a password-protected
/// screen that displays random images of dogs.
class BlizzardDemo extends StatelessWidget {
  const BlizzardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      home: ContactScreen(),
      theme: NeumorphicThemeData(
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
