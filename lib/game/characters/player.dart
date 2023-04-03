// Clase que define el comportamiento del personaje
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../../common/enums.dart';

class PlayerGame extends SpriteAnimationGroupComponent<AnimationPlayerStates>
    with CollisionCallbacks {
  bool isFish = false;
  final List collisionDirection = [];
  double _characterSpeed = 100;
  late final JoystickComponent joystick;
  final List sizeMap;
  PlayerGame(this.sizeMap, this.joystick, Image image,
      Map<AnimationPlayerStates, SpriteAnimationData> animationMap)
      : super.fromFrameData(image, animationMap, size: Vector2(64, 64));

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    // Instancia para craeación del spritesheet el cual contendra las animaciónes

    debugMode = true;
    position = Vector2(529, 128);

    // Se añade el personaje al juego
    add(RectangleHitbox(size: Vector2(42, 44), position: Vector2(12, 12)));
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (joystick.direction != JoystickDirection.idle) {
      collisionDirection.add(joystick.direction);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Switch el cual nos proporciona los diferentes opciones que seran cambiadas al se tocada la pantalla
    if (!isFish) {
      switch (joystick.direction) {
        case JoystickDirection.idle:
          current = AnimationPlayerStates.idle;

          break;
        case JoystickDirection.down:
          current = AnimationPlayerStates.down;

          if (y < sizeMap[1] - height &&
              !collisionDirection.contains(JoystickDirection.down)) {
            y += dt * _characterSpeed;
          }

          break;
        case JoystickDirection.left:
          current = AnimationPlayerStates.left;

          if (x > 0) {
            if (!collisionDirection.contains(JoystickDirection.left)) {
              x -= dt * _characterSpeed;
            }
          }
          break;
        case JoystickDirection.up:
          current = AnimationPlayerStates.up;

          if (y > 0 && !collisionDirection.contains(JoystickDirection.up)) {
            y -= dt * _characterSpeed;
          }

          break;
        case JoystickDirection.right:
          current = AnimationPlayerStates.right;

          if (x < sizeMap[0] - width &&
              !collisionDirection.contains(JoystickDirection.right)) {
            x += dt * _characterSpeed;
          }

          break;
        default:
      }
    }
  }

  void speedRun() => _characterSpeed = 150;

  void speedWalk() => _characterSpeed = 100;

  void fishedStart() {
    if (!isFish) {
      isFish = true;
      animations![AnimationPlayerStates.fishDown]!.reset();
      current = AnimationPlayerStates.fishDown;
    } else {
      isFish = false;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);

    switch (joystick.direction) {
      case JoystickDirection.down:
        collisionDirection.remove(JoystickDirection.up);

        break;
      case JoystickDirection.left:
        collisionDirection.remove(JoystickDirection.right);

        break;
      case JoystickDirection.up:
        collisionDirection.remove(JoystickDirection.down);

        break;
      case JoystickDirection.right:
        collisionDirection.remove(JoystickDirection.left);

        break;
      default:
    }
    if (activeCollisions.isEmpty) collisionDirection.clear();
  }
}
