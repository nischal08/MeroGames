import 'package:flutter/material.dart';

class GeneralMaterialButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  GeneralMaterialButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(32),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: 200,
        height: 42,
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
