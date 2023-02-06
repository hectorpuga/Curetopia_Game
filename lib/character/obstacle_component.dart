import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_george_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class ObstacleComponent extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  @override
  Future<void>? onLoad() {
    add(RectangleHitbox(isSolid: true, priority: 4, anchor: Anchor.topLeft));
    return null;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (gameRef.joystick.direction != JoystickDirection.idle) {
      gameRef.collisionDirection.add(gameRef.joystick.direction);
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print("obstacle");
    print(gameRef.george.activeCollisions.isEmpty);
    print(gameRef.george.activeCollisions);

    super.onCollisionEnd(other);

    switch (gameRef.joystick.direction) {
      case JoystickDirection.down:
        gameRef.collisionDirection.remove(JoystickDirection.up);
        break;
      case JoystickDirection.left:
        gameRef.collisionDirection.remove(JoystickDirection.right);

        break;
      case JoystickDirection.up:
        gameRef.collisionDirection.remove(JoystickDirection.down);

        break;
      case JoystickDirection.right:
        gameRef.collisionDirection.remove(JoystickDirection.left);

        break;
      default:
    }
  }
}
