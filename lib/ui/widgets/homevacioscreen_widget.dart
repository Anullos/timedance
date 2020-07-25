import 'package:flutter/material.dart';
import 'package:timedance/ui/propiedades.dart';

class HomeScreenVacioWidget extends StatelessWidget {
  final VoidCallback onTap;

  const HomeScreenVacioWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/welcome.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxPageWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Text(
                    "Hola, \nBienvenido",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "¿Qué te parece si agregamos \nuna nueva ciudad?",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("Agregar ciudad"),
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
