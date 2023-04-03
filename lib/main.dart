import 'package:Game/provider/game_provider.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'game/menus/main_menu.dart';
import 'game/my_game.dart';
import 'game/overlays/overlay_controller.dart';

void main() {
  // Inicializa los metodos de pantalla completa en el juego
  WidgetsFlutterBinding.ensureInitialized();
  // implementa pantalla completa
  Flame.device.fullScreen();
  // Implementa rotación de pantalla completa
  Flame.device.setLandscape();
  runApp(
      // Creación de estados del juego
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Consumer(builder: (context, value, child) {
                final gameProvider = context.read<GameProvider>();

                return Scaffold(
                    body: GameWidget(
                  loadingBuilder: (context) => const Center(
                      child: SizedBox(
                    width: 200,
                    // Creación de barra de carga inicial
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      minHeight: 3,
                      backgroundColor: Colors.black,
                    ),
                  )),
                  game: MyGame(gameProvider),
                  overlayBuilderMap: {
                    'ButtonController': (_, MyGame game) => OverlayController(
                          game: game,
                        ),
                    'Menu': (_, MyGame game) => MainMenu(game)
                  },
                  initialActiveOverlays: const ["ButtonController"],
                ));
              }))));
}
