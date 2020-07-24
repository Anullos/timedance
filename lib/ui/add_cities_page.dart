import 'package:flutter/material.dart';
import 'package:timedance/bloc/addcity_bloc.dart';
import 'package:timedance/model/city.dart';
import 'package:timedance/ui/propiedades.dart';
import 'package:timedance/ui/widgets/header_widget.dart';
import 'package:timedance/ui/widgets/loader_widget.dart';

class AddCitiesPage extends StatefulWidget {
  const AddCitiesPage({Key key}) : super(key: key);
  // AddCitiesPage._(); // para hacer el constructor privado

  @override
  _AddCitiesPageState createState() => _AddCitiesPageState();
}

class _AddCitiesPageState extends State<AddCitiesPage> {
  final bloc = AddCityBloc();

  void handleAddTap(City city) async{
    final result = await bloc.addCity(city);
    if(result){
      Navigator.of(context).pop();
    }
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
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                HeaderWidget(
                  title: "Agregar ciudad",
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: TextField(
                    onChanged: (value) {
                      // print(value);
                      bloc.onChangedText(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Buscar ciudad",
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                if (bloc.errorMessage != null)
                  Text(bloc.errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.cities.length,
                    itemBuilder: (context, index) {
                      final city = bloc.cities[index];
                      return ListTile(
                        title: Text(
                          city.title,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add, color: primaryColorApp),
                          onPressed: () {
                            handleAddTap(city);
                          },
                        ),
                      );
                    },
                  ),
                ),
                if (bloc.loading)
                  Center(
                    child: LoaderWidget(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
