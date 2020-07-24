import 'package:flutter/material.dart';
import 'package:timedance/bloc/cities_bloc.dart';
import 'package:timedance/model/city.dart';
import 'package:timedance/ui/add_cities_page.dart';
import 'package:timedance/ui/propiedades.dart';
import 'package:timedance/ui/widgets/header_widget.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  final bloc = CitiesBloc();

  @override
  void initState() {
    bloc.loadCities();
    super.initState();
  }

  void handleNavigationPress(BuildContext context) async {
    //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddCitiesPage()));
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (_, animation1, animation2) {
          return SlideTransition(
            position:
                Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                    .animate(animation1),
            child: AddCitiesPage(),
            // return FadeTransition(
            //   opacity: animation1,
            //   child: AddCitiesPage(),
          );
        },
      ),
    );
    bloc.loadCities();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColorApp,
              onPressed: () => handleNavigationPress(context),
              child: Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  HeaderWidget(
                    title: "Mis ciudades",
                  ),
                  Expanded(
                    child: bloc.cities.isEmpty
                        ? Center(
                            child: Text("No tienes ciudades :("),
                          )
                        : ListView.builder(
                            itemCount: bloc.cities.length,
                            itemBuilder: (context, index) {
                              final city = bloc.cities[index];
                              return CityItem(city: city);
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CityItem extends StatelessWidget {
  final City city;

  const CityItem({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              city.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            InkWell(
              child: Icon(Icons.close),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
