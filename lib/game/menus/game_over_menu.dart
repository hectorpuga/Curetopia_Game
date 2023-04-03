import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../my_game.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class GameOverMenu extends StatelessWidget {
  static const id = "GameOverMenu";
  MyGame gameRef;
  GameOverMenu(this.gameRef);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MenuBase(
        title: Column(children: [
          const Text(
            "Game over",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ]),
        buttons: [
          ButtonMenu("Reiniciar", Icons.play_arrow_rounded, () {
            gameRef.overlays.remove(GameOverMenu.id);
          }),
          ButtonMenu("Salir", Icons.settings_rounded, () {
            SystemNavigator.pop();
          })
        ]);
  }
}
