import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int _friends = 0;
  bool _showDialog = true;

  int _bakedGoodsInventory = 0;
  String _dialogMessage = "Hi. I am player. I have just"
      "moved to Happy Bay Village"
      "I want to make friends.";

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

  bool get showDialog => _showDialog;

  set showDialog(bool showDialog) {
    _showDialog = showDialog;
    notifyListeners();
  }

  String get dialogMessage => _dialogMessage;

  set dialogMessage(String dialogMessage) {
    _dialogMessage = dialogMessage;
    notifyListeners();
  }
}
