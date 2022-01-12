import 'package:blizzard_demo/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// A widget to display a color channel and its value.
class ColorValueField extends StatelessWidget {
  const ColorValueField({Key? key, required this.color, required this.value})
      : super(key: key);

  /// The color channel to display, i.e. "R", "G" or "B".
  final String color;

  /// The value of the channel, i.e. 0 - 255.
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$color:',
                    textAlign: TextAlign.center,
                    style: COLOR_VALUE_TEXT,
                  ),
                ),
                Expanded(
                  child: Text(
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: COLOR_VALUE_TEXT,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
