import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// A widget to display an image.
///
/// Displays an image from the given URL. The DogImage widget does not need
/// to display an image of a dog. There's nothing dog specific about it, but
/// it's right there in the name. Probably should be a dog.
class DogImage extends StatelessWidget {
  const DogImage({Key? key, required this.url}) : super(key: key);

  /// The URL of the image to display
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(url),
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const SpinKitCircle(color: Colors.white);
      },
    );
  }
}
