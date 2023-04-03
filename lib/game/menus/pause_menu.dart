import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../my_game.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

// ignore: must_be_immutable
class PauseMenu extends StatelessWidget {
  static const id = "PauseMenu";
  MyGame gameRef;
  PauseMenu(this.gameRef, {super.key});
  @override
  Widget build(BuildContext context) {
    return MenuBase(buttons: [
      ButtonMenu("Reanudar", Icons.play_arrow_rounded, () {
        showHud();
      }),
      ButtonMenu("Reiniciar", Icons.refresh_rounded, () {
        showHud();
      }),
      ButtonMenu("Salir", Icons.exit_to_app_rounded, () {
        SystemNavigator.pop();
      })
    ]);
  }

  showHud() {
    gameRef.overlays.remove(PauseMenu.id);
    gameRef.resumeEngine();
  }
}
