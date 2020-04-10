import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List nomes = ["Jamilton","Maria","João", "Carla"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              //Utilização do Dismisseble
              final item = nomes[index];
                return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(13),
                    child: Row(
                      //O icone vai ficar no começo
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.red,
                    child: Row(
                      //O icone vai ficar no fim
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  //direction: DismissDirection.horizontal, por padrão é horizontal
                  //Saber para qual direção foi arrastado
                  onDismissed: (direction){

                      //Fazer ações a partir da direção que foi executada
                      if(direction==DismissDirection.endToStart){
                        print("Direção endToStart");
                      }else if (direction==DismissDirection.startToEnd){
                        print("Direção startToEnd");
                      }
                      setState(() {
                          nomes.removeAt(index);
                      });

                  },
                  //Chave de diferencial, o ideal é fazer combinações para
                  // que as chaves não se repitam
                    key: Key(item),
                    child: ListTile(
                      title: Text(item),
                    )
                );
            },
              itemCount: nomes.length
            ),
          )
        ],
      )
    );
  }
}
