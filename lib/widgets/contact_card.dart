import 'package:blizzard_demo/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

/// A material design card to display contact information.
///
/// Based on the [Card] widget. The [icon] is placed at the leading edge and
/// [text] is used as the title. When tapped, the corresponding [url] will
/// attempt to open.
class ContactCard extends StatelessWidget {
  /// Creates a contact card.
  ///
  /// The [url] should include the appropriate prefix for the contact link,
  /// e.g., a telephone link begins with 'tel:'.
  const ContactCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.url,
  });

  /// The card's icon.
  final IconData icon;

  /// The card's displayed text.
  final String text;

  /// The card's linked contact.
  final String url;

  /// Attempts to open the card's linked [url].
  ///
  /// Throws an exception if the contact link is not able to be launched.
  void launchContact() async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: launchContact,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: TEXT_COLOR,
          size: 30.0,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: BUTTON_TEXT_STYLE,
          ),
        ),
      ),
    );
  }
}
