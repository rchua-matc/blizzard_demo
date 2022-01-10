// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorValueField extends StatelessWidget {
  ColorValueField({required this.color, required this.value});

  final String color;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$color:'),
              ),
              Expanded(
                child: Text(
                  value.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
