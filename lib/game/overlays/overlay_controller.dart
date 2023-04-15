import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../my_game.dart';
import '../../provider/invetario.dart';
import 'audio_overlay.dart';

class OverlayController extends StatelessWidget {
  static const String name = "OverlayController";
  final MyGame game;
  const OverlayController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AudioOverlay(game),
      ],
    );
  }
}
