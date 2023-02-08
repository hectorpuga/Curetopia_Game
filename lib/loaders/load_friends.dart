import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/character/friend_component.dart';

import '../my_george_game.dart';

void loadFriends(TiledComponent homeMap, MyGame game) {
  final friendGroup = homeMap.tileMap.getLayer<ObjectGroup>("Friends");

  for (var friendBox in friendGroup!.objects) {
    var friend = FriendComponent()
      ..position = Vector2(friendBox.x, friendBox.y)
      ..width = friendBox.width
      ..height = friendBox.height
      ..debugMode = true;
    game.componentList.add(friend);
    game.maxFriends++;
    game.add(friend);
  }
}
