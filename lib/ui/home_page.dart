import 'package:flutter/material.dart';
import 'package:timedance/ui/cities_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  void handleNavegationPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CitiesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Image.asset('assets/images/welcome.jpg'),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 230.0,
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
                      style:
                          TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
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
                      onPressed: () => handleNavegationPress(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
