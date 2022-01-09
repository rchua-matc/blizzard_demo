import 'package:flutter/material.dart';
import 'package:blizzard_demo/widgets/contact_card.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/chua.jpg'),
              radius: 50.0,
            ),
            Text(
              'Ryan Chua',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            ContactCard(
              icon: Icons.phone,
              text: '608-514-5293',
              url: 'tel:6085145293',
            ),
            ContactCard(
              icon: Icons.email,
              text: 'rchua@wisc.edu',
              url: 'mailto:rchua@wisc.edu',
            ),
          ],
        ),
      ),
    );
  }
}
