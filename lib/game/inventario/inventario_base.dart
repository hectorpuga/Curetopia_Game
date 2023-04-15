import 'package:flutter/material.dart';
import 'package:game/provider/invetario.dart';
import 'package:provider/provider.dart';
import '../my_game.dart';
import 'components/box_draggable.dart';
import 'components/box_targetdraggble.dart';

class InventaryBase extends StatelessWidget {
  static String name = 'Inventario';
  final MyGame game;
  const InventaryBase(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    final provider = context.watch<GameProvider>();

    return Column(children: [
      Container(
        height: sized.height * 0.15,
        width: sized.width,
        color: Colors.brown,
        child: ElevatedButton(
            onPressed: () {
              game.overlays.remove(name);
            },
            child: const Text("Salir")),
      ),
      Expanded(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.getMedicina.length,
            padding: EdgeInsets.symmetric(
                horizontal: sized.width * 0.15, vertical: sized.height * 0.05),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (_, i) {
              return (!provider.movComponent)
                  ? BoxDraggable(
                      i,
                      provider,
                      sized,
                    )
                  : BoxTargetDraggable(provider, i);
            }),
      ),
    ]);
  }
}
