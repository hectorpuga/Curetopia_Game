import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:george/provider/game_provider.dart';

import 'character/george_component.dart';
import 'dialog/dialog_box.dart';
import 'loaders/add_baked_goods.dart';
import 'loaders/load_friends.dart';
import 'loaders/load_gems.dart';
import 'loaders/load_obstacles.dart';

class MyGame extends FlameGame with HasCollisionDetection, HasDraggables {
  // Variable para la creación del personaje
  late GeorgeComponent george;
  // Nombre de el sonido de musica del fondo
  String soundTrackName = 'ukulele';

  // late SpriteComponent background;

  late JoystickComponent joystick;

  int sceneNumber = 1;
  late TiledComponent homeMap;
  int maxFriends = 0;

  List<Component> componentList = [];

  int gemInventory = 0;

  // 0=idle, 1=down, 2=left, 3=up, 4=right
  List collisionDirection = [];
  bool collision = false;
  // Velocidad de la animación(mientras menor sea el numero sera mas la velocidad)
  final double animationSpeed = .1;
  // Tamaño del personaje
  double charactersize = 64;
  // Velocidad la cual tendra el personaje
  double characterSpeed = 100;
  // Ancho del mapa que se utiliza para que el personaje explore
  late double mapWidth;
  // Largo del mapa que se utiliza para que el personaje explore
  late double mapHeight;
  // Numero de amigos que tiene el personaje

  // late DialogBox dialogBox;

  late AudioPool yummy;
  late AudioPool applause;

  GameProvider gameProvider;
  MyGame(this.gameProvider);
  // Metodo asincrono el cual se ejecuta inicialmente en el juego y nos ayuda a obtener recurso del juego
  @override
  Future<void> onLoad() async {
    super.onLoad();
    homeMap = await TiledComponent.load("map.tmx", Vector2.all(16));
    add(homeMap);

    george = GeorgeComponent();
    add(george);

    mapWidth = homeMap.size.x;
    mapHeight = homeMap.size.y;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    yummy = await AudioPool.create("audio/sfx/yummy.mp3", maxPlayers: 1);
    applause = await AudioPool.create("audio/sfx/applause.mp3", maxPlayers: 2);

    // Creación de instanciacion para el fondo del juego
    // Sprite backgroundSprite = await loadSprite("background.png");
    // background = SpriteComponent()
    //   ..sprite = backgroundSprite
    //   ..size = backgroundSprite.originalSize;
    // Añadiendo fondo al juego
    //add(background);

    // Iniciación para utilizar el audio

    // FlameAudio.bgm.initialize();
    // FlameAudio.audioCache.load("music.mp3");
    // FlameAudio.bgm.play("music.mp3");

    // Creación de camara la cual seguira a nuestro personaje y a dicha camara se le da una restricción hasta donde puede seguir al personaje
    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
    // add(dialogBox);

    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();

    joystick = JoystickComponent(
        knob: CircleComponent(radius: 30, paint: knobPaint),
        background: CircleComponent(radius: 50, paint: backgroundPaint),
        margin: const EdgeInsets.only(left: 40, bottom: 30));
    add(joystick);
  }

  // Metodo de actualizción que se ejecuta infinitamente al ser ejecutado el juego

  // Metodo sobreescribido del TapDetector para asi poder incorporar nuevas instrucciones al ser ejecutado

  void newScene() async {
    print("change to a new scene");
    String mapFile = "happy_map.tmx";
    homeMap.removeFromParent();
    gameProvider.bakedGoodsInventory = 0;
    gameProvider.friends = 0;
    maxFriends = 0;
    // FlameAudio.bgm.stop();
    for (var component in componentList) {
      component.removeFromParent();
    }
    componentList = [];

    gameProvider.showDialog = false;
    remove(george);

    remove(joystick);

    if (sceneNumber == 2) {
      print('moving to map2');
    } else if (sceneNumber == 3) {
      print('moving to scene 3');
      mapFile = 'scene3.tmx';
    } else if (sceneNumber == 4) {
      print('moving to scene 4');
      mapFile = 'scene4.tmx';
    }

    homeMap = await TiledComponent.load(mapFile, Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.size.x;
    mapHeight = homeMap.size.y;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);
    if (sceneNumber == 4) {
      loadGems(homeMap, this);
    }

    george = GeorgeComponent();

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();

    joystick = JoystickComponent(
        knob: CircleComponent(radius: 30, paint: knobPaint),
        background: CircleComponent(radius: 50, paint: backgroundPaint),
        margin: const EdgeInsets.only(left: 40, bottom: 30));
    add(joystick);
  }

  @override
  Color backgroundColor() => Colors.pink;
}
