import 'package:flutter/material.dart';

class GeneralElevatedButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Function onPressed;

  GeneralElevatedButton({
    this.onPressed,
    this.label,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      height: 60.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: 18,
                color: bgColor == Colors.white ? Colors.black : Colors.white,
              ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
