// Clase que define el comportamiento del personaje
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import '../my_george_game.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  // Animación del personaje caminando hacia abajo
  late SpriteAnimation downAnimation;
  // Animación del personaje caminando hacia la izquierda
  late SpriteAnimation leftAnimation;
  // Animación del personaje caminando hacia la derecha
  late SpriteAnimation rightAnimation;
  // Animación del personaje caminando hacia arriba
  late SpriteAnimation upAnimation;
  // Animación del personaje sin hacer ninguna accion
  late SpriteAnimation idleAnimation;
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    // Instancia para craeación del spritesheet el cual contendra las animaciónes
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load("george2.png"),
        srcSize: Vector2(48, 48));
    // Instanciaciones para la creción de las animaciónes
    downAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: gameRef.animationSpeed, to: 4);
    leftAnimation = spriteSheet.createAnimation(
        row: 1, stepTime: gameRef.animationSpeed, to: 4);
    upAnimation = spriteSheet.createAnimation(
        row: 2, stepTime: gameRef.animationSpeed, to: 4);
    rightAnimation = spriteSheet.createAnimation(
        row: 3, stepTime: gameRef.animationSpeed, to: 4);
    idleAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: gameRef.animationSpeed, to: 1);

    // Instanciación del personaje para su creación

    debugMode = true;
    animation = idleAnimation;
    position = Vector2(529, 128);
    size = Vector2.all(gameRef.charactersize);

    // Se añade el personaje al juego
    add(RectangleHitbox(size: Vector2(42, 44), position: Vector2(12, 12)));
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    // Switch el cual nos proporciona los diferentes opciones que seran cambiadas al se tocada la pantalla
    switch (gameRef.joystick.direction) {
      case JoystickDirection.idle:
        animation = idleAnimation;

        break;
      case JoystickDirection.down:
        animation = downAnimation;
        if (y < gameRef.mapHeight - height) {
          if (!game.collisionDirection.contains(JoystickDirection.down)) {
            y += dt * gameRef.characterSpeed;
          }
        }

        break;
      case JoystickDirection.left:
        animation = leftAnimation;
        if (x > 0) {
          if (!game.collisionDirection.contains(JoystickDirection.left)) {
            x -= dt * gameRef.characterSpeed;
          }
        }
        break;
      case JoystickDirection.up:
        animation = upAnimation;

        if (y > 0) {
          if (!game.collisionDirection.contains(JoystickDirection.up)) {
            y -= dt * gameRef.characterSpeed;
          }
        }

        break;
      case JoystickDirection.right:
        animation = rightAnimation;

        if (x < gameRef.mapWidth - width) {
          if (!game.collisionDirection.contains(JoystickDirection.right)) {
            x += dt * gameRef.characterSpeed;
          }
        }
        break;
      default:
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print("george");
    // TODO: implement onCollisionEnd
    super.onCollisionEnd(other);

    print(activeCollisions.isEmpty);
    print(activeCollisions);
    if (activeCollisions.isEmpty) {
      gameRef.collisionDirection = [];
    }
  }
}
