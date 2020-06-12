import 'package:flutter/material.dart';
import 'package:lista_estatica/providers/estudiantes_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HomePage extends StatelessWidget {
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Lista Datos'),
        leading: Icon(Icons.list),
      ),
      body: Container(
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top:Radius.circular(30),bottom:Radius.circular(0))
        ),
          child: Column(
            children: <Widget> [
                Container(
                width: double.infinity,
                height: 40.0,
                child: Text('Estudiantes',style: TextStyle(fontSize: 25.0),),
              ),
              Expanded(
                child: _crearListaEstudiantes(),
              )
            ],
          ),
        )
      )
    );
  }

  Widget _crearListaEstudiantes(){
    var provider = new EstudiantesProvider();

    return FutureBuilder(
      future: provider.cargarDatosEstudiantes(),
      builder: (context,snapshot){
        return ListView(
          children: _crearElementosListaEstudiantes(snapshot.data),
        );
      }
    
    );
  }

  List<Widget> _crearElementosListaEstudiantes(List<dynamic> datos){
    final List<Widget> lista = new List<Widget>();

    for (var estudiante in datos) {
      lista.add(
        ListTile( 
          title: Text(estudiante['first_name']+' '+estudiante['last_name']),
          subtitle: Text(estudiante['email']),
          leading: Icon(estudiante['gender']=='Male'?MdiIcons.genderMale:MdiIcons.genderMaleFemale),
        )
      );
      lista.add(Divider());
    }
    return lista;
  }
}