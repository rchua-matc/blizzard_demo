import 'package:flutter/material.dart';
import 'package:blizzard_demo/widgets/hue_painter.dart';

/// A widget to pick a specific hue.
///
/// Color spectrum is created by [HuePainter] using HSV colors for accuracy.
class HuePicker extends StatefulWidget {
  const HuePicker(
      {Key? key, required this.selectedHue, required this.onHueSelected})
      : super(key: key);

  /// The currently selected hue, i.e. 0 to 360.
  final double selectedHue;

  /// Callback for when the hue is picked.
  final Function onHueSelected;

  @override
  _HuePickerState createState() => _HuePickerState();
}

class _HuePickerState extends State<HuePicker> {
  /// Changes the selected hue based on the location of the slider.
  void _onDragStart(DragStartDetails details) {
    if (widget.onHueSelected != null) {
      final sliderPercent = _calculateSliderPercent(details.localPosition);
      widget.onHueSelected(
        _hueFromSliderPercent(sliderPercent),
      );
    }
  }

  /// Changes the selected hue based on the location of the slider.
  void _onDragUpdate(DragUpdateDetails details) {
    if (widget.onHueSelected != null) {
      final sliderPercent = _calculateSliderPercent(details.localPosition);
      widget.onHueSelected(
        _hueFromSliderPercent(sliderPercent),
      );
    }
  }

  /// Calculates the position of the slider on the color picker.
  double _calculateSliderPercent(Offset localPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return (1.0 - (localPosition.dx / box.size.width)).clamp(0.0, 1.0);
  }

  /// Converts the position of the slider to the corresponding hue on the
  /// color spectrum.
  double _hueFromSliderPercent(double sliderPercent) {
    return (1.0 - sliderPercent) * 360;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanStart: _onDragStart,
          onPanUpdate: _onDragUpdate,
          child: Stack(
            children: [
              CustomPaint(
                painter: HuePainter(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              _buildSelector(constraints.maxWidth),
            ],
          ),
        );
      },
    );
  }

  /// The slider for the hue picker.
  Widget _buildSelector(double width) {
    /// The location of the slider for the corresponding hue.
    final huePercent = widget.selectedHue / 360;

    return Align(
      alignment: Alignment((huePercent * 2) - 1.0, 0.0),
      child: Container(
        height: 50.0,
        width: 3.0,
        color: Colors.white,
      ),
    );
  }
}
