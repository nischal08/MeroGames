import 'package:flutter/material.dart';

class LogoMeroGames extends StatelessWidget {
  const LogoMeroGames({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: Image.asset(
            'assets/neon.png',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Mero Games',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.indigoAccent,
                fontSize: 30,
              ),
        )
      ],
    );
  }
}
