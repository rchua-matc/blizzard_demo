import 'package:blizzard_demo/constants.dart';
import 'package:blizzard_demo/widgets/contact_card.dart';
import 'package:blizzard_demo/screens/password_screen.dart';
import 'package:blizzard_demo/screens/color_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// A screen with the author's contact information and links to the other pages.
///
/// Touching the contact information will open the corresponding app for easy
/// communication.
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Neumorphic(
              style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/chua.jpg'),
                radius: 50.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 20.0,
              ),
              child: Text(
                'Ryan Chua',
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'Montserrat',
                  color: TEXT_COLOR,
                ),
              ),
            ),
            const ContactCard(
              icon: Icons.phone,
              text: '608-514-5293',
              url: 'tel:6085145293',
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ContactCard(
                icon: Icons.email,
                text: 'rchua@wisc.edu',
                url: 'mailto:rchua@wisc.edu',
              ),
            ),
            NeumorphicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorScreen(),
                  ),
                );
              },
              margin: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Text(
                  'Color Picker',
                  textAlign: TextAlign.center,
                  style: BUTTON_TEXT_STYLE,
                ),
              ),
            ),
            NeumorphicButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PasswordScreen();
                  },
                );
              },
              margin: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Text(
                  'Secret Screen',
                  textAlign: TextAlign.center,
                  style: BUTTON_TEXT_STYLE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
