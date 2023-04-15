import 'package:flutter/material.dart';

import '../../../provider/invetario.dart';
import '../../articles/medicina.dart';

class BoxTargetDraggable extends StatelessWidget {
  const BoxTargetDraggable(this.provider, this.i, {super.key});

  final GameProvider provider;
  final int i;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: DragTarget<Map<String, List<MedicinaComponent>>>(
          onAccept: acceptDataTarget,
          builder: (_, __, ___) => Container(
                color: Colors.red,
                child: (provider.getMedicina[i] != null)
                    ? Stack(
                        children: [
                          RawImage(image: provider.getImageMedic(i)),
                          Text('${provider.cantMedic(i)}'),
                        ],
                      )
                    : null,
              )),
    );
  }

  acceptDataTarget(Map<String, List<MedicinaComponent>> data) {
    print(data);
    print(provider.getMedicina.indexOf(data));
    if (provider.getMedicina[i] == null) {
      print("Entre en la condcion");
      provider.setCambioValor(data, i);
    }
  }
}
