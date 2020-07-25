import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timedance/model/city.dart';
import 'package:timedance/ui/propiedades.dart';
import 'package:timedance/ui/widgets/climadetalles_widget.dart';

DateFormat format = DateFormat('E, dd MMM yyyy');

class HomeClimasScreenWidget extends StatefulWidget {
  final List<City> cities;
  final VoidCallback onTap;

  const HomeClimasScreenWidget({Key key, this.cities, this.onTap})
      : super(key: key);

  @override
  _HomeClimasScreenWidgetState createState() => _HomeClimasScreenWidgetState();
}

class _HomeClimasScreenWidgetState extends State<HomeClimasScreenWidget> {
  /* int _currentIndex = 0;

  void left() {
    if (_currentIndex - 1 >= 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void right() {
    if (_currentIndex + 1 < widget.cities.length) {
      setState(() {
        _currentIndex++;
      });
    }
  }*/

  double page = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleArroyPressed(City city) {
    showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      builder: (_) {
        return ClimaDetallesWidget(
          city: city,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /*  FadeIndexedWidget(
          currentIndex: _currentIndex,
          children: widget.cities
              .map(
                (city) => ClimasItem(
                  city: city,
                ),
              )
              .toList(),
        ),*/
        PageView.builder(
          itemCount: widget.cities.length,
          itemBuilder: (context, index) {
            final city = widget.cities[index];
            double opacity = (index - page).abs();
            if (opacity > 1) opacity = 1;
            return Opacity(
              opacity: 1,
              child: ClimasItem(
                city: city,
                onTap: () => handleArroyPressed(city),
              ),
            );
          },
        ),
        Positioned(
          top: 20,
          left: 15,
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: widget.onTap,
          ),
        ),
        /*  Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: left,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: right,
          ),
        ),*/
      ],
    );
  }
}

class ClimasItem extends StatelessWidget {
  final City city;
  final VoidCallback onTap;

  const ClimasItem({Key key, this.city, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clima = city.climas.first;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/${clima.weatherStateAbbr}.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Text(
                city.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: shadowApp,
                ),
              ),
              Text(
                format.format(clima.applicableDate).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  shadows: shadowApp,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      clima.theTemp.toInt().toString(),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: shadowApp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Text(
                        'ºC',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: shadowApp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                clima.weatherStateName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: shadowApp,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
