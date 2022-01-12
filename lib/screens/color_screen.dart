import 'package:blizzard_demo/constants.dart';
import 'package:blizzard_demo/widgets/hue_picker.dart';
import 'package:blizzard_demo/widgets/color_value_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// A screen with a color picker.
///
/// Contains a slider to pick a color, a circle showing the currently selected
/// color, and the RGB values of the currently selected color. When the "Go!"
/// button is pressed, a webpage is opened with the selected color as the
/// background.
class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  /// The currently selected color.
  HSVColor _hsvColor = const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0);

  /// Opens a webpage with the selected color as the background color.
  ///
  /// Converts the current color to the RGB values and passes each channel
  /// as a parameter in the webpage's query string. If the page fails to open,
  /// throws and exception.
  void launchWebpage() async {
    Color background = _hsvColor.toColor();
    String red = background.red.toString();
    String blue = background.blue.toString();
    String green = background.green.toString();
    String url = "https://rchua.net/color/index.php?r=$red&g=$green&b=$blue";
    if (!await launch(url)) throw 'Could not launch webpage';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              size: 35.0,
              color: TEXT_COLOR,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ColorValueField(
                    color: "R",
                    value: _hsvColor.toColor().red,
                  ),
                  ColorValueField(
                    color: "G",
                    value: _hsvColor.toColor().green,
                  ),
                  ColorValueField(
                    color: "B",
                    value: _hsvColor.toColor().blue,
                  ),
                ],
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Neumorphic(
                    style: const NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      shape: NeumorphicShape.convex,
                      border: NeumorphicBorder(
                        color: Color(0x33000000),
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: _hsvColor.toColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: HuePicker(
                      selectedHue: _hsvColor.hue,
                      onHueSelected: (double newHue) {
                        setState(() {
                          _hsvColor = _hsvColor.withHue(newHue);
                        });
                      }),
                ),
              ),
              NeumorphicButton(
                onPressed: launchWebpage,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Go!',
                    textAlign: TextAlign.center,
                    style: BUTTON_TEXT_STYLE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
