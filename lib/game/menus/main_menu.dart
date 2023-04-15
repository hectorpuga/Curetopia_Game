import 'package:flutter/material.dart';

import '../my_game.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

// ignore: must_be_immutable
class MainMenu extends StatelessWidget {
  static const name = "MainMenu";
  MyGame gameRef;
  MainMenu(this.gameRef, {super.key});
  @override
  Widget build(BuildContext context) {
    return MenuBase(buttons: [
      ButtonMenu("Jugar", Icons.play_arrow_rounded, () {
        gameRef.overlays.remove("Menu");
        gameRef.resumeEngine();
      }),
      ButtonMenu("Opciones", Icons.settings_rounded, () {})
    ]);
  }
}
