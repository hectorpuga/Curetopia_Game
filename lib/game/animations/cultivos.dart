import 'package:flame/components.dart';

import '../../common/enums.dart';

// Getter el cual contendra el mapa con su respectiva llave la cual sera una de los enum las cuales tendra el valor de animaciones
get animationMapCultivos => {
      AnimationCultivosStates.plantasion: createAnimationMov(1, 0.0),
      AnimationCultivosStates.crecimiento: createAnimationMov(1, 1.0),
      AnimationCultivosStates.listo: createAnimationMov(1, 2.0),
    };
SpriteAnimationData createAnimationMov(int amount, double column,
        {speed = 0.1, x = 0.0, loop = true}) =>
    // Animacion de secuencia
    SpriteAnimationData.sequenced(
        // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
        amount: 1,
        // Propiedad en la cual debemos de especificar el tiempo en el cual las imagenes se iran cambiando mediante la animación
        stepTime: speed,

        // Pixeles o resolución de cada imagen que recorreremos en el spritesheet
        textureSize: Vector2(192, 256),
        texturePosition: Vector2((192 * column), 0));
