// Clase que define el comportamiento del personaje
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import '../../common/enums.dart';
import '../my_game.dart';

class PlayerGame extends SpriteAnimationGroupComponent<AnimationPlayerStates>
    with CollisionCallbacks, HasGameRef<MyGame> {
  double characterSpeed = 100;
  PlayerGame(
      Image image, Map<AnimationPlayerStates, SpriteAnimationData> animationMap)
      : super.fromFrameData(image, animationMap);

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    current = AnimationPlayerStates.idle;
    // Instancia para craeación del spritesheet el cual contendra las animaciónes
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load("Ash.png"), srcSize: Vector2(48, 48));
    debugMode = true;
    position = Vector2(529, 128);
    size = Vector2.all(64);

    // Se añade el personaje al juego
    add(RectangleHitbox(size: Vector2(42, 44), position: Vector2(12, 12)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Switch el cual nos proporciona los diferentes opciones que seran cambiadas al se tocada la pantalla
    switch (gameRef.joystick.direction) {
      case JoystickDirection.idle:
        current = AnimationPlayerStates.idle;

        break;
      case JoystickDirection.down:
        current = AnimationPlayerStates.down;

        if (y < gameRef.mapHeight - height) {
          if (!game.collisionDirection.contains(JoystickDirection.down)) {
            y += dt * characterSpeed;
          }
        }

        break;
      case JoystickDirection.left:
        current = AnimationPlayerStates.left;

        if (x > 0) {
          if (!game.collisionDirection.contains(JoystickDirection.left)) {
            x -= dt * characterSpeed;
          }
        }
        break;
      case JoystickDirection.up:
        current = AnimationPlayerStates.up;

        if (y > 0) {
          if (!game.collisionDirection.contains(JoystickDirection.up)) {
            y -= dt * characterSpeed;
          }
        }

        break;
      case JoystickDirection.right:
        current = AnimationPlayerStates.right;

        if (x < gameRef.mapWidth - width) {
          if (!game.collisionDirection.contains(JoystickDirection.right)) {
            x += dt * characterSpeed;
          }
        }
        break;
      default:
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (activeCollisions.isEmpty) {
      gameRef.collisionDirection = [];
    }
  }
}
