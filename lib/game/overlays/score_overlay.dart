import 'package:flutter/material.dart';

import '../../provider/game_provider.dart';

class ScoreOver extends StatelessWidget {
  const ScoreOver({
    super.key,
    required this.gameProvider,
  });

  final GameProvider gameProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Image.asset(
            "assets/images/friend.png",
            scale: 0.7,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: Text(
              "${gameProvider.friends}",
              style: const TextStyle(fontSize: 28, color: Colors.black45),
            )),
        const SizedBox(
          width: 12,
        ),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Image.asset(
            "assets/images/choco_cake.png",
            scale: 0.8,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: Text(
              "${gameProvider.bakedGoodsInventory}",
              style: const TextStyle(fontSize: 28, color: Colors.black45),
            )),
      ],
    );
  }
}
