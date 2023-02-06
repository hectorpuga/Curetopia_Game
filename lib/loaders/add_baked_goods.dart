import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../character/baked_good_component.dart';
import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getLayer<ObjectGroup>("BakedGoods");
  for (var bakedGood in bakedGoodsGroup!.objects) {
    switch (bakedGood.type) {
      case "ApplePie":
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("apple_pie.png")
          ..debugMode = true);
        break;

      case "Cookie":
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("cookies.png")
          ..debugMode = true);
        break;

      case "CheeseCake":
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("cheesecake.png")
          ..debugMode = true);
        break;

      case "ChocoCake":
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("choco_cake.png")
          ..debugMode = true);
        break;

      default:
    }
  }
}
