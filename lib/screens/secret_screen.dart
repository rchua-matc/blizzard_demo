import 'package:flutter/material.dart';
import 'package:blizzard_demo/services/network.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:blizzard_demo/widgets/dog_image.dart';

/// A screen that displays random images of dogs.
///
/// Upon page load, a random image of a dog is displayed. A new image is
/// displayed each time the user clicks the "Show me the dog" button.
class SecretScreen extends StatefulWidget {
  const SecretScreen({Key? key}) : super(key: key);

  @override
  State<SecretScreen> createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  /// The API request helper object querying the dog API
  NetworkHelper network =
      NetworkHelper(url: Uri.https('dog.ceo', '/api/breeds/image/random'));

  /// The URL of the dog image to display
  String url = '';

  @override
  void initState() {
    super.initState();
    newDog();
  }

  /// Gets a new dog image to display.
  void newDog() async {
    setState(() {
      url = '';
    });
    var dog = await network.getData();
    setState(() {
      url = dog['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NeumorphicAppBar(
        leading: NeumorphicButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            depth: 4,
            intensity: 0.5,
            shape: NeumorphicShape.concave,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              size: 35.0,
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: (url.isNotEmpty)
                    ? DogImage(url: url)
                    : const SpinKitCircle(
                        color: Colors.white,
                      ),
              ),
            ),
            NeumorphicButton(
              onPressed: newDog,
              margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 40.0),
              child: Text(
                'Show me a dog!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
