import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:george/overlay_controller.dart';
import 'package:george/dialog/dialog_box.dart';
import 'package:george/loaders/add_baked_goods.dart';
import 'package:george/provider/game_provider.dart';
import 'package:provider/provider.dart';

import 'character/friend_component.dart';
import 'character/george_component.dart';
import 'loaders/load_friends.dart';
import 'loaders/load_obstacles.dart';
import 'my_george_game.dart';

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
