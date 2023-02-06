import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_george_game.dart';

class BakedGoodComponent extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  @override
  Future<void>? onLoad() async {
    super.onLoad();

    debugMode = true;
    add(RectangleHitbox(size: Vector2(25, 20), position: Vector2(3, 6)));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    gameRef.gameProvider.bakedGoodsInventory++;
    print("baked goods inve");
    gameRef.yummy.start();
    gameRef.remove(this);
  }
}
