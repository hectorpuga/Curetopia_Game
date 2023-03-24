import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../articles/obstacle_component.dart';
import '../my_game.dart';

void loadObstacles(TiledComponent homeMap, MyGame game) {
  final obstaclesGroup = homeMap.tileMap.getLayer<ObjectGroup>("Obstacles");

  for (var obstaclesBox in obstaclesGroup!.objects) {
    final obstacle = ObstacleComponent()
      ..position = Vector2(obstaclesBox.x, obstaclesBox.y)
      ..width = obstaclesBox.width
      ..height = obstaclesBox.height
      ..debugMode = true;

    game.componentList.add(obstacle);
    game.add(obstacle);
  }
}
