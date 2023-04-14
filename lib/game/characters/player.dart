// Clase que define el comportamiento del personaje
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/game/my_game.dart';
import '../../common/enums.dart';
import '../articles/obstacle_component.dart';

class PlayerGame extends SpriteAnimationGroupComponent<AnimationPlayerStates>
    with CollisionCallbacks ,HasGameRef<MyGame>{
  bool isFish = false;
  final List collisionDirection = [];
  double _characterSpeed = 100;
  final JoystickComponent joystick;
  final List sizeMap;
  PlayerGame(this.sizeMap, this.joystick, Image image,
      Map<AnimationPlayerStates, SpriteAnimationData> animationMap)
      : super.fromFrameData(image, animationMap, size: Vector2(64, 64));

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    debugMode = true;
    position = Vector2(529, 450);
    add(RectangleHitbox(size: Vector2(42, 44), position: Vector2(12, 12)));
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (joystick.direction != JoystickDirection.idle && other is ObstacleComponent) collisionDirection.add(joystick.direction);
    
  }


  @override
  void update(double dt) {
    super.update(dt);
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
