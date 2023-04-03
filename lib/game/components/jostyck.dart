import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class JostickGame extends JoystickComponent {
  JostickGame()
      : super(
            margin: const EdgeInsets.only(left: 40, bottom: 30),
            background: CircleComponent(
                radius: 50, paint: BasicPalette.blue.withAlpha(100).paint()),
            knob: CircleComponent(
                radius: 30, paint: BasicPalette.blue.withAlpha(200).paint()));
}
