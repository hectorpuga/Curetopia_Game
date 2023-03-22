import 'package:Game/character/player_component.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class GemComponent extends SpriteComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  @override
  Future<void>? onLoad() {
    add(RectangleHitbox());
    return null;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is PlayerComponent) {
      game.gemInventory++;
      game.applause.start();
    }
    game.remove(this);
    super.onCollision(intersectionPoints, other);
  }
}
