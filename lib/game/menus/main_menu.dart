import 'package:flutter/material.dart';

import '../my_game.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class MainMenu extends StatelessWidget {
  static const id = "MainMenu";
  MyGame gameRef;
  MainMenu(this.gameRef);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MenuBase(buttons: [
      ButtonMenu("Jugar", Icons.play_arrow_rounded, () {
        gameRef.overlays.remove("Menu");
        gameRef.resumeEngine();
      }),
      ButtonMenu("Opciones", Icons.settings_rounded, () {})
    ]);
  }
}
