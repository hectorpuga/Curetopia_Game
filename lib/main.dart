import 'package:Game/provider/game_provider.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'game/my_game.dart';
import 'game/overlays/overlay_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  // Creación de instancia del juego para ser ejecutada
  runApp(MultiProvider(
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
                child: LinearProgressIndicator(
                  color: Colors.white,
                  minHeight: 3,
                  backgroundColor: Colors.black,
                ),
              )),
              game: MyGame(gameProvider),
              overlayBuilderMap: {
                'ButtonController': (BuildContext context, MyGame game) =>
                    OverlayController(
                      game: game,
                    ),
              },
              initialActiveOverlays: ["ButtonController"],
            ));
          }))));
}
