import 'package:flutter/material.dart';
import 'package:game/game/game.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late PlayerGame player;
  late JoystickComponent joystick;
  late TiledComponent homeMap;
  final List<Component> componentList = [];
  late double mapWidth;
  late DialogBox dialogBox;
  late double mapHeight;
  final imageAssets = ["AshAnimateds.png", "Boton.png"];
  final GameProvider gameProvider;
  late final HudButtonComponent buttonFish;
  MyGame(this.gameProvider);
  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.loadAll(imageAssets);
    homeMap = await TiledComponent.load("Mundo_Principal.tmx", Vector2.all(48));
    mapWidth = homeMap.size.x;
    mapHeight = homeMap.size.y;

    dialogBox = DialogBox(
      game: this,
      text:
          "Hola, Bienvendio a esta aventura\n la cual tratara de recolectar medicamento",
    );

    joystick = JostickGame();

    player = PlayerGame([
      mapWidth,
      mapHeight,
    ], joystick, images.fromCache("AshAnimateds.png"), animationMapPlayer);
    final buttonRun =
        ButtonActions(images.fromCache("Boton.png"), Vector2.all(80), 80, 60)
          ..onPressed = player.speedRun
          ..onReleased = player.speedWalk
          ..onCancelled = player.speedWalk;

    buttonFish =
        ButtonActions(images.fromCache("Boton.png"), Vector2.all(80), 0, 60)
          ..onPressed = player.fishedStart
          ..onCancelled = () => player.isFish = false;

    add(homeMap);
    add(joystick);
    add(player);
    // Loads.components(homeMap, this, "Obstacles");
    // Loads.components(homeMap, this, "Fish");
    add(dialogBox);
    add(buttonRun);

    camera.followComponent(player,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  Color backgroundColor() => Colors.pink;
}
