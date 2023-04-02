import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class ObstacleComponent extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  @override
  Future<void>? onLoad() {
    add(RectangleHitbox(isSolid: true, priority: 4, anchor: Anchor.topLeft));
    return null;
  }
}
