import 'package:flutter/cupertino.dart';
import 'package:game/provider/invetario.dart';

class BoxContainerDragger extends StatelessWidget {
  const BoxContainerDragger(
    this.sized,
    this.provider,
    this.i, {
    super.key,
  });

  final Size sized;
  final GameProvider provider;
  final int i;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: (((sized.width - ((sized.width * 0.15) * 2)) / 8) - 10),
          height: (((sized.height - ((sized.height * 0.05) * 2)) / 4) - 10),
          child: (provider.getMedicina[i] != null)
              ? RawImage(image: provider.getImageMedic(i))
              : null,
        ));
  }
}
