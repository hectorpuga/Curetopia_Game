import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/provider/invetario.dart';
import 'package:provider/provider.dart';
import 'game/inventario/inventario_base.dart';
import 'game/menus/main_menu.dart';
import 'game/my_game.dart';
import 'game/overlays/overlay_controller.dart';

void main() {
  // Inicializa los metodos de pantalla completa en el juego
  WidgetsFlutterBinding.ensureInitialized();
  // implementa pantalla completa
  Flame.device.fullScreen();
  // Implementa rotación de pantalla completa
  Flame.device.setLandscape();
  // Creación de estados del juego

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
        child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: GameWidget(
          loadingBuilder: (context) => const Center(
              child: SizedBox(
            width: 200,
            // Creación de barra de carga inicial
            child: LinearProgressIndicator(
              color: Colors.white,
              minHeight: 3,
              backgroundColor: Colors.black,
            ),
          )),
          game: MyGame(gameProvider),
          overlayBuilderMap: {
            OverlayController.name: (_, MyGame game) => OverlayController(
                  game: game,
                ),
            MainMenu.name: (_, MyGame game) => MainMenu(game),
            InventaryBase.name: (_, MyGame game) => InventaryBase(game)
          },
          initialActiveOverlays: const [OverlayController.name],
        )));
  }
}
