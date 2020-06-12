import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  
  final listaEstudiantes = ['Estudiante 1','Estudiante 2','Estudiante 3'];

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
                child: ListView(
                      children: _cargarListaEstudiantes()
                ),
              )
            ],
          ),
        )
      )
    );
  }

  List<Widget> _cargarListaEstudiantes(){
    List<Widget>  lista = new List<Widget>();

    for (var i = 0; i < listaEstudiantes.length; i++) {
      lista.add(
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(listaEstudiantes[i]),
        )
      );
      lista.add(Divider());
    }
    return lista; 
  }
}