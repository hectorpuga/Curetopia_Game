import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class ObstacleComponent extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {

  List<Vector2>? lista;
  ObstacleComponent({this.lista});
  @override
  void onLoad() {
    if(lista!=null){
    add(PolygonHitbox(lista!, anchor: Anchor.topLeft));
    }
    add(RectangleHitbox());}
  
  
 
}
