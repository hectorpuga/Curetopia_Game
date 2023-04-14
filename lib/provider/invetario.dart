import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../game/articles/medicina.dart';

class GameProvider extends ChangeNotifier {

  int _id=0;
 

  bool _movComponent = false;

    final List <MedicinaComponent?>_medicinas=[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,];

    bool get movComponent => _movComponent;

    set movComponent(bool value) {
    _movComponent = value;
    notifyListeners();
    }

    set setMedicina(MedicinaComponent medicina){

      if(_id<_medicinas.length){
_medicinas[_id++]=medicina;
      }
    
    notifyListeners();

    }

   get getMedicina=>_medicinas;


   get id=>_id;

  
}
