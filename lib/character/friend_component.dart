import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george/character/george_component.dart';
import 'package:george/dialog/dialog_box.dart';

import '../my_george_game.dart';

// Clase para crear un cuadro de contorno al rededor de los graficos de amigos
class FriendComponent extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  bool v = false;
  @override
  Future<void>? onLoad() {
    add(RectangleHitbox());
    return null;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    String text = "";
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if (other is GeorgeComponent) {
      if (gameRef.gameProvider.bakedGoodsInventory > 0) {
        gameRef.gameProvider.friends++;
        gameRef.applause.start();
        game.gameProvider.dialogMessage =
            "Wow. Thanks so much. Please come over"
            "this weekend for dinner. I have to run now."
            "See you on Saturday at 7pm";
        gameRef.gameProvider.bakedGoodsInventory--;
        game.gameProvider.showDialog = true;
        // gameRef.dialogBox = DialogBox(game: gameRef, text: text);

        // gameRef.add(gameRef.dialogBox);
      } else {
        game.gameProvider.dialogMessage =
            "Great to meet you.Sorry, I have to run to a meeting.";
        game.gameProvider.showDialog = true;
        print("Entre pero no me mostres ");

        // gameRef.dialogBox = DialogBox(game: gameRef, text: text);
        // gameRef.add(gameRef.dialogBox);
      }
      gameRef.remove(this);
    }
  }
}
