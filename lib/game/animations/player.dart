import 'package:flame/components.dart';

import '../../common/enums.dart';

// Getter el cual contendra el mapa con su respectiva llave la cual sera una de los enum las cuales tendra el valor de animaciones
get animationMapPlayer => {
      AnimationPlayerStates.idle: SpriteAnimationData.sequenced(
          texturePosition: Vector2(0, 0),
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(48, 48)),
      AnimationPlayerStates.left: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(48, 48),
          texturePosition: Vector2(0, 48)),
      AnimationPlayerStates.up: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(48, 48),
          texturePosition: Vector2(0, 96)),
      AnimationPlayerStates.right: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(48, 48),
          texturePosition: Vector2(0, 144)),
      AnimationPlayerStates.down:
          // Animacion de secuencia
          SpriteAnimationData.sequenced(
              // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
              amount: 4,
              // Propiedad en la cual debemos de especificar el tiempo en el cual las imagenes se iran cambiando mediante la animación
              stepTime: 0.1,
              // Pixeles o resolución de cada imagen que recorreremos en el spritesheet
              textureSize: Vector2(48, 48)),
    };
