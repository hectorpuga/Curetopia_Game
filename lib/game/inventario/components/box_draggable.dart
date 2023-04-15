import 'package:flutter/material.dart';
import '../../../provider/invetario.dart';
import '../../articles/medicina.dart';
import 'box_feedback.dart';

class BoxDraggable extends StatelessWidget {
  const BoxDraggable(
    this.i,
    this.provider,
    this.sized, {
    super.key,
  });

  final int i;
  final GameProvider provider;
  final Size sized;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Draggable<Map<String, List<MedicinaComponent>>>(
          onDragStarted: () {
            if (provider.getMedicina[i] != null) {
              provider.movComponent = true;
            }
          },
          onDragCompleted: () {
            print("HOla me acomplete");
            provider.movComponent = false;
          },
          onDraggableCanceled: (a, b) {
            print("HOla me cancele");

            provider.movComponent = false;
          },
          data: provider.getMedicina[i],
          feedback: BoxContainerDragger(
            sized,
            provider,
            i,
          ),
          child: Container(
            color: Colors.blueAccent,
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
}
