import 'dart:ui';

import 'package:flutter/material.dart';

import 'buttom_menu.dart';

// ignore: must_be_immutable
class MenuBase extends StatelessWidget {
  final List<ButtonMenu> buttons;
  Widget? title;
  MenuBase({super.key, required this.buttons, this.title});
  @override
  Widget build(BuildContext context) {
    title ??= const Text(
      "Juego",
      style: TextStyle(fontSize: 40, color: Colors.white),
    );
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: title,
              ),
              Column(
                children: buttons,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
