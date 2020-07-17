import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas=0;
  String info = "Pode entrar...";
  void _alterarPessoas(int delta){
    setState(() {
      _pessoas+=delta;
      if(_pessoas<0){
        info="Completamente Vazio!!";
        _pessoas=0;
      }else if(_pessoas < 10){
        info = "Pode entrar!!";
      }else{
        info = "Estamos lotados!! \n Por favor Aguarde.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas $_pessoas",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _alterarPessoas(1);
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _alterarPessoas(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              info,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            )
          ],
        ),
      ],
    );
  }
}
