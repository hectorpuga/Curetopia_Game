import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'articles/obstacle_component.dart';
import 'articles/fish_article.dart';
import 'my_game.dart';

class Loads {
  static components(TiledComponent homeMap, MyGame game, String component) {
    ObjectGroup? obstaclesGroup = homeMap.tileMap.getLayer(component);

    for (TiledObject obstaclesBox in obstaclesGroup!.objects) {

List<Vector2> polygenVectores=[];
      if(obstaclesBox.isPolygon){
        polygenVectores= listPolyng(obstaclesBox.polygon);

      }
      final obstacle = determinaObject(component,polygenVectores)
        ..position = Vector2(obstaclesBox.x, obstaclesBox.y)
        ..width = obstaclesBox.width
        ..height = obstaclesBox.height
        ;

      game.componentList.add(obstacle);
      
      game.add(obstacle);
    }
  }

  static listPolyng(List<Point> listPoint){

    List<Vector2>listVector=[];

    for (Point point in listPoint) {
listVector.add(Vector2(point.x, point.y));
      
    }

    return listVector;


  }

  static determinaObject(String campo,List<Vector2> lista )=>
       campo == "Fish" ? Fish() : lista.isEmpty?ObstacleComponent():ObstacleComponent(lista: lista);
      
      
}
