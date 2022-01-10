import 'package:flutter/material.dart';
import 'package:blizzard_demo/services/network.dart';
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
      backgroundColor: Colors.redAccent,
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
            ElevatedButton(
              onPressed: newDog,
              child: const Text(
                'Show me the dog',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
