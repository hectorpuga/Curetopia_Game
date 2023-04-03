import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  const ButtonMenu(this.title, this.icon, this.onPressed, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            backgroundColor: Colors.pink),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
