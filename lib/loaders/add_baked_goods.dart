import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../character/baked_good_component.dart';
import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getLayer<ObjectGroup>("BakedGoods");
  for (var bakedGood in bakedGoodsGroup!.objects) {
    switch (bakedGood.type) {
      case "ApplePie":
        var applePie = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("apple_pie.png")
          ..debugMode = true;

        game.componentList.add(applePie);
        game.add(applePie);
        break;

      case "Cookie":
        var cookie = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("cookies.png")
          ..debugMode = true;
        game.add(cookie);

        game.componentList.add(cookie);
        break;

      case "CheeseCake":
        var cheeseCake = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("cheesecake.png")
          ..debugMode = true;
        game.add(cheeseCake);
        game.componentList.add(cheeseCake);
        break;

      case "ChocoCake":
        var chocoCake = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite("choco_cake.png")
          ..debugMode = true;
        game.add(chocoCake);
        game.componentList.add(chocoCake);
        break;

      default:
    }
  }
}
