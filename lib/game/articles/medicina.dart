import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:game/game/export_game.dart';
import 'package:game/game/my_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class MedicinaComponent extends SpriteComponent with CollisionCallbacks {
  Image image;
  String? nombre;
  int? cantidad;
  MyGame game;
  MedicinaComponent(this.image, this.game, {this.nombre, this.cantidad})
      : super.fromImage(image);
  @override
  Future<void>? onLoad() async {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayerGame &&
        game.gameProvider.id < game.gameProvider.getMedicina.length) {
      game.gameProvider.setMedicina = this;
      removeFromParent();
    }
  }
}
