import 'package:flutter/material.dart';
import 'package:timedance/bloc/cities_bloc.dart';
import 'package:timedance/ui/cities_page.dart';
import 'package:timedance/ui/widgets/homevacioscreen_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = CitiesBloc();

  void handleNavegationPress(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CitiesPage()));
  }

  @override
  void initState() {
    bloc.loadCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, child) {
          return Scaffold(
            body: bloc.cities.isEmpty
                ? HomeScreenVacioWidget(
                    onTap: () => handleNavegationPress(context))
                : Center(
                    child: Text('no se duerman'),
                  ),
          );
        });
  }
}
