import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george/character/george_component.dart';
import 'package:george/dialog/dialog_box.dart';

import '../my_george_game.dart';

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
    if (other is GeorgeComponent) {
      game.gemInventory++;
      game.applause.start();
    }
    game.remove(this);
    super.onCollision(intersectionPoints, other);
  }
}
