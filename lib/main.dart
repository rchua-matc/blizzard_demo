import 'package:flutter/material.dart';
import 'widgets/contact_card.dart';

void main() {
  runApp(const BlizzardDemo());
}

class BlizzardDemo extends StatelessWidget {
  const BlizzardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('images/chua.jpg'),
                radius: 50.0,
              ),
              const Text(
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
      ),
    );
  }
}
