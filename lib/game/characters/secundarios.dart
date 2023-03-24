import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class FriendComponent extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  bool v = false;
  @override
  Future<void>? onLoad() {
    add(RectangleHitbox());
    return null;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    String text = "";
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }
}
