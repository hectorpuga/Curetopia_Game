import 'package:flutter/material.dart';

import '../game/articles/medicina.dart';

class GameProvider extends ChangeNotifier {
  int _id = 0;
  bool _movComponent = false;
  final _medicinas = List<Map<String, List<MedicinaComponent>>?>.filled(
      32, null,
      growable: false);
  bool get movComponent => _movComponent;

  set movComponent(bool value) {
    _movComponent = value;
    notifyListeners();
  }

  set setMedicina(MedicinaComponent medicina) {
    bool isNull = true;

    if (_id < _medicinas.length) {
      for (final map in _medicinas) {
        if (map != null && map.containsKey(medicina.nombre)) {
          map[medicina.nombre]?.add(medicina);
          isNull = false;
          break;
        }
      }

      if (isNull) {
        _medicinas[_id++] = {
          medicina.nombre!: [medicina]
        };
      }
    }
    notifyListeners();
  }

  setCambioValor(Map<String, List<MedicinaComponent>> dato, int i) {
    _medicinas[_medicinas.indexOf(dato)] = null;
    _medicinas[i] = dato;
    if (id > 0) _id--;
    print("................................................");
    print(_medicinas);
    notifyListeners();
  }

  List<Map<String, List<MedicinaComponent>>?> get getMedicina => _medicinas;

  get id => _id;

  cantMedic(i) => _medicinas[i]!.values.toList()[0].length;

  getImageMedic(i) => _medicinas[i]!.values.toList()[0][0].image;
}
