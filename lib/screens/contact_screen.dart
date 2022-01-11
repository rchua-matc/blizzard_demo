// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blizzard_demo/widgets/contact_card.dart';
import 'package:blizzard_demo/screens/password_screen.dart';
import 'package:blizzard_demo/screens/color_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ContactScreen extends StatefulWidget {
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
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/chua.jpg'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 20.0,
              ),
              child: Text(
                'Ryan Chua',
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'Montserrat',
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            ContactCard(
              icon: Icons.phone,
              text: '608-514-5293',
              url: 'tel:6085145293',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
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
                    builder: (context) => ColorScreen(),
                  ),
                );
              },
              margin: EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Color Picker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 18.0,
                  ),
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
              margin: EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Secret Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
