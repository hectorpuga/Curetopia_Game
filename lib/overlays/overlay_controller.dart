import 'package:george/overlays/score_overlay.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:george/provider/game_provider.dart';

import '../my_george_game.dart';
import 'audio_overlay.dart';
import 'dialog_overlay.dart';

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
              Expanded(
                  flex: 2,
                  child: DialogOverlay(
                    game: game,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
