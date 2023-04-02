import 'package:flame/components.dart';

import '../../common/enums.dart';

// Getter el cual contendra el mapa con su respectiva llave la cual sera una de los enum las cuales tendra el valor de animaciones
get animationMapPlayer => {
      AnimationPlayerStates.idle: createAnimationMov(1, 0.0)                                                          ,
      AnimationPlayerStates.left: createAnimationMov(3, 2.0),
      AnimationPlayerStates.up: createAnimationMov(3, 3),
      AnimationPlayerStates.right: createAnimationMov(3, 1.0),
      AnimationPlayerStates.down: createAnimationMov(3, 0),
      AnimationPlayerStates.fishDown:
          createAnimationMov(4, 0.0, loop: false, speed: 0.5, x: 90.0),
      AnimationPlayerStates.fishUp:
          createAnimationMov(4, 3.0, loop: false, speed: 0.5, x: 90.0),
      AnimationPlayerStates.fishLeft:
          createAnimationMov(4, 2.0, loop: false, speed: 0.5, x: 90.0),
      AnimationPlayerStates.fishRight:
          createAnimationMov(4, 1.0, loop: false, speed: 0.5, x: 90.0),
    };
SpriteAnimationData createAnimationMov(int amount, double row,
        {speed = 0.1, x = 0.0, loop = true}) =>
    // Animacion de secuencia
    SpriteAnimationData.sequenced(
        // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
        amount: amount,
        // Propiedad en la cual debemos de especificar el tiempo en el cual las imagenes se iran cambiando mediante la animación
        stepTime: speed,
        loop: loop,

        // Pixeles o resolución de cada imagen que recorreremos en el spritesheet
        textureSize: Vector2(30, 35),
        texturePosition: Vector2(x, (35 * row)));
