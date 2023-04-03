import 'package:flutter/cupertino.dart';

import '../game.dart';

class ButtonActions extends HudButtonComponent {
  ButtonActions(image, size, double right, double bottom)
      : super(
          margin: EdgeInsets.only(
            right: right,
            bottom: bottom,
          ),
          button: SpriteComponent(
            sprite: Sprite(image),
            size: size,
          ),
        );
}
