import 'package:game/game/overlays/score_overlay.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../my_game.dart';
import '../../provider/game_provider.dart';
import 'audio_overlay.dart';

class OverlayController extends StatelessWidget {
  final MyGame game;
  const OverlayController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AudioOverlay(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: ScoreOver(gameProvider: gameProvider)),
            ],
          ),
        )
      ],
    );
  }
}
