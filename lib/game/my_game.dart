import 'package:flutter/material.dart';

import 'game.dart';

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
  static const imageAssets = [
    "Ash.png",
  ];

  GameProvider gameProvider;
  MyGame(this.gameProvider);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(imageAssets);
    homeMap = await TiledComponent.load("map.tmx", Vector2.all(16));
    add(homeMap);

    player = PlayerGame(images.fromCache("Ash.png"), animationMapPlayer);
    add(player);

    mapWidth = homeMap.size.x;
    mapHeight = homeMap.size.y;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    camera.followComponent(player,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    joystick = JostickGame();
    add(joystick);
  }

  @override
  Color backgroundColor() => Colors.pink;
}
