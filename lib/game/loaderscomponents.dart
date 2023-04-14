
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'articles/medicina.dart';
import 'articles/obstacle_component.dart';
import 'articles/fish_article.dart';
import 'my_game.dart';

class Loads {

  static components(TiledComponent homeMap, MyGame game, String component,{image}) {
    int cant=-1;
    final ObjectGroup? obstaclesGroup = homeMap.tileMap.getLayer(component);
    List<Vector2> polygenVectores=[];

      for (TiledObject obstaclesBox in obstaclesGroup!.objects) {


        if( obstaclesBox.name=="M1"){
          cant++;
        }


       if(obstaclesBox.isPolygon)polygenVectores= listPolyng(obstaclesBox.polygon);

          game.add(determinaObject(component,polygenVectores,game,image: image,cant: cant,nombre: obstaclesBox.name)
              ..position = Vector2(obstaclesBox.x, obstaclesBox.y)
              ..width = obstaclesBox.width
              ..height = obstaclesBox.height
        );
       polygenVectores=[];

    }
  }


  static listPolyng(List<Point> listPoint){

    final listVector=<Vector2>[];

     for (Point point in listPoint) { 
       listVector.add(Vector2(point.x, point.y));
    }
return listVector;

  }

  static determinaObject(String campo,List<Vector2> lista ,MyGame game,{image,cant,nombre})=> campo == "Fish" ? Fish() :campo=="Objects"?MedicinaComponent(image,game,cantidad: cant,nombre:nombre):lista.isEmpty?ObstacleComponent():ObstacleComponent(lista: lista);
       
       
       
      
      
}
