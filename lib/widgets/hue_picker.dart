// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:blizzard_demo/widgets/hue_painter.dart';

class HuePicker extends StatefulWidget {
  const HuePicker(
      {Key? key, required this.selectedHue, required this.onHueSelected})
      : super(key: key);

  final double selectedHue;
  final Function onHueSelected;

  @override
  _HuePickerState createState() => _HuePickerState();
}

class _HuePickerState extends State<HuePicker> {
  void _onDragStart(DragStartDetails details) {
    if (widget.onHueSelected != null) {
      final sliderPercent = _calculateSliderPercent(details.localPosition);
      widget.onHueSelected(
        _hueFromSliderPercent(sliderPercent),
      );
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (widget.onHueSelected != null) {
      final sliderPercent = _calculateSliderPercent(details.localPosition);
      widget.onHueSelected(
        _hueFromSliderPercent(sliderPercent),
      );
    }
  }

  double _calculateSliderPercent(Offset localPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return (1.0 - (localPosition.dx / box.size.width)).clamp(0.0, 1.0);
  }

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
                  decoration: BoxDecoration(
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

  Widget _buildSelector(double width) {
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
