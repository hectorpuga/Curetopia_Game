import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int _friends = 0;

  int _bakedGoodsInventory = 0;

  int get friends => _friends;

  set friends(int friend) {
    _friends = friend;
    notifyListeners();
  }

  int get bakedGoodsInventory => _bakedGoodsInventory;

  set bakedGoodsInventory(int bakedGoodsInventory) {
    _bakedGoodsInventory = bakedGoodsInventory;
    notifyListeners();
  }
}
