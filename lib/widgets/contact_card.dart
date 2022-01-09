import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  ContactCard({required this.icon, required this.text, required this.url});

  final IconData icon;
  final String text;
  final String url;

  void launchContact() async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: launchContact,
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          title: Text(
            text,
          ),
        ),
      ),
    );
  }
}
