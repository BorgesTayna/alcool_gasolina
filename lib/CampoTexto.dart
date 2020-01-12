import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
String _textoResultado = "";
  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Preço inválido, digite os valores com (.)";
      });
    }else{
      if( (precoAlcool/precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }
      //_limparDados();
    }

  }

  void _limparDados(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Alcool ou Gasolina?"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecer o seu carro!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 3.20"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 4.50"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Calcular",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular),
              ),
              Padding(padding: EdgeInsets.only(top: 22),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      )
      );
  }
}