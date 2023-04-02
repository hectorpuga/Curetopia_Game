import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'articles/obstacle_component.dart';
import 'articles/fish_article.dart';
import 'my_game.dart';

class Loads {
  static components(TiledComponent homeMap, MyGame game, String component) {
    dynamic obstaclesGroup = homeMap.tileMap.getLayer<ObjectGroup>(component);

    for (var obstaclesBox in obstaclesGroup!.objects) {
      final obstacle = determinaObject(component)
        ..position = Vector2(obstaclesBox.x, obstaclesBox.y)
        ..width = obstaclesBox.width
        ..height = obstaclesBox.height
        ..debugMode = true;

      game.componentList.add(obstacle);
      game.add(obstacle);
    }
  }

  static determinaObject(String compo) =>
      compo == "Fish" ? Fish() : ObstacleComponent();
}
