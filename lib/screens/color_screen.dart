// ignore_for_file: prefer_const_constructors

import 'package:blizzard_demo/widgets/hue_picker.dart';
import 'package:flutter/material.dart';
import 'package:blizzard_demo/widgets/color_value_field.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  HSVColor _hsvColor = HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: _hsvColor.toColor(),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50.0,
                decoration: BoxDecoration(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back',
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
