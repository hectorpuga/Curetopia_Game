import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:provider/provider.dart';

import '../my_game.dart';
import '../provider/game_provider.dart';

class DialogOverlay extends StatelessWidget {
  final MyGame game;
  const DialogOverlay({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();

    return game.gameProvider.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
                isRepeatingAnimation: false,
                onFinished: () {
                  print("Dialogo finalizado");
                  game.gameProvider.showDialog = false;
                },
                animatedTexts: [
                  TyperAnimatedText(
                      textStyle:
                          const TextStyle(fontSize: 28, fontFamily: 'vt323'),
                      speed: const Duration(milliseconds: 50),
                      gameProvider.dialogMessage)
                ]),
          )
        : Container();
  }
}
