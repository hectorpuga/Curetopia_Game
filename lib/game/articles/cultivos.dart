// Clase que define el comportamiento del personaje
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/game/my_game.dart';
import '../../common/enums.dart';
import '../characters/player.dart';

class CultivosGame
    extends SpriteAnimationGroupComponent<AnimationCultivosStates>
    with CollisionCallbacks, HasGameRef<MyGame> {
  int opcion = 0;
  final Timer timer = Timer(3, repeat: false, autoStart: false);
  CultivosGame(Image image,
      Map<AnimationCultivosStates, SpriteAnimationData> animationMap)
      : super.fromFrameData(image, animationMap, size: Vector2.all(100));

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    debugMode = true;
    position = Vector2(529, 2300);
    add(RectangleHitbox(size: Vector2.all(100)));
    current = AnimationCultivosStates.plantasion;

    timer.onTick = actionTimerAnimation;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayerGame) {
      if (!timer.isRunning()) {
        print("HOla entre en colsion");
        timer.start();
      }
    }
  }

  actionTimerAnimation() {
    if (opcion > 2) opcion = 0;
    switch (opcion) {
      case 0:
        current = AnimationCultivosStates.plantasion;
        timer.reset();
        timer.resume();

        break;
      case 1:
        current = AnimationCultivosStates.crecimiento;
        timer.limit = 40;
        timer.reset();
        timer.resume();
        break;
      case 2:
        current = AnimationCultivosStates.listo;
        timer.reset();
        timer.pause();
        break;
      default:
    }
    opcion++;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    timer.update(dt);
  }
}
