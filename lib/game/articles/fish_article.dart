import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class Fish extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  @override
  void onLoad() {
    add(RectangleHitbox(isSolid: true, priority: 4, anchor: Anchor.topLeft));

  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    gameRef.add(gameRef.buttonFish);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    gameRef.remove(gameRef.buttonFish);
  }
}
