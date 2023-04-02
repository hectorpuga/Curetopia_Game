import 'package:flutter/material.dart';

import 'game.dart';
import 'loaderscomponents.dart';

class MyGame extends FlameGame with HasCollisionDetection, HasDraggables {
  late PlayerGame player;
  late JoystickComponent joystick;
  int sceneNumber = 1;
  late TiledComponent homeMap;
  int maxFriends = 0;
  List<Component> componentList = [];
  int gemInventory = 0;
  List collisionDirection = [];
  late double mapWidth;
  late double mapHeight;
  bool isIdle = false;
  bool activeCollision = false;
  static const imageAssets = [
    "AshAnimateds.png",
  ];

  GameProvider gameProvider;
  MyGame(this.gameProvider);
  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.loadAll(imageAssets);
    homeMap = await TiledComponent.load("map.tmx", Vector2.all(16));

    add(homeMap);
    mapWidth = homeMap.size.x;
    mapHeight = homeMap.size.y;
    Loads.components(homeMap, this, "Obstacles");
    Loads.components(homeMap, this, "Fish");

    joystick = JostickGame();
    add(joystick);

    player =
        PlayerGame(images.fromCache("AshAnimateds.png"), animationMapPlayer);
    add(player);

    camera.followComponent(player,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  Color backgroundColor() => Colors.pink;
}
