import 'package:flame_audio/flame_audio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:george/provider/game_provider.dart';

import '../my_george_game.dart';
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
              Container(
                color: const Color.fromARGB(167, 218, 218, 218),
                child: Image.asset(
                  "assets/images/friend.png",
                  scale: 0.7,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                  color: const Color.fromARGB(167, 218, 218, 218),
                  child: Text(
                    "${gameProvider.friends}",
                    style: const TextStyle(fontSize: 28, color: Colors.black45),
                  )),
              const SizedBox(
                width: 12,
              ),
              Container(
                color: const Color.fromARGB(167, 218, 218, 218),
                child: Image.asset(
                  "assets/images/choco_cake.png",
                  scale: 0.8,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                  color: const Color.fromARGB(167, 218, 218, 218),
                  child: Text(
                    "${gameProvider.bakedGoodsInventory}",
                    style: const TextStyle(fontSize: 28, color: Colors.black45),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
