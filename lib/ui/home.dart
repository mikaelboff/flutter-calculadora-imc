import 'package:flutter/material.dart';

// Abaixo de 17	Muito abaixo do peso
// Entre 17 e 18,49	Abaixo do peso
// Entre 18,5 e 24,99	Peso normal
// Entre 25 e 29,99	Acima do peso
// Entre 30 e 34,99	Obesidade I
// Entre 35 e 39,99	Obesidade II (severa)
// Acima de 40	Obesidade III (mórbida)

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alturaController = new TextEditingController();
  final TextEditingController _pesoController = new TextEditingController();

  double _resultadoFinal = 0.0;
  String _descricao = "Informe sua altura, idade e peso";
  String _descricaoAdicional = "";

  void _calculaIMC() {
    setState(() {
      _descricaoAdicional = "";

      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text);

      if (_alturaController.text.isEmpty || altura <= 0.0) {
        _descricao = "Informe sua altura";
        return;
      }

      if (_pesoController.text.isEmpty || peso <= 0.0) {
        _descricao = "Informe seu peso";
        return;
      }

      _resultadoFinal = peso / (altura * altura);

      if (_resultadoFinal < 17.0) {
        _descricaoAdicional = "Muito abaixo do peso";
      } else if (_resultadoFinal >= 17.0 && _resultadoFinal <= 18.49) {
        _descricaoAdicional = "Abaixo do peso";
      } else if (_resultadoFinal >= 18.5 && _resultadoFinal <= 24.99) {
        _descricaoAdicional = "Peso normal";
      } else if (_resultadoFinal >= 25.0 && _resultadoFinal <= 29.99) {
        _descricaoAdicional = "Acima do peso";
      } else if (_resultadoFinal >= 30.0 && _resultadoFinal <= 34.99) {
        _descricaoAdicional = "Obesidade I";
      } else if (_resultadoFinal >= 35.0 && _resultadoFinal <= 39.99) {
        _descricaoAdicional = "Obesidade II (severa)";
      } else {
        _descricaoAdicional = "Obesidade III (mórbida)";
      }

      _descricao = "Seu IMC é ${_resultadoFinal.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC"),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Image.asset(
              'assets/imc-logo.png',
              height: 80.0,
              width: 75.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
              color: Colors.grey.shade300,
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _alturaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Informe sua altura",
                        labelText: "Altura (m)",
                        icon: Icon(Icons.insert_chart),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _pesoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Informe seu peso",
                        labelText: "Peso (kg)",
                        icon: Icon(Icons.line_weight),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () => _calculaIMC(),
                            color: Colors.pinkAccent,
                            child: Text(
                              "Calcular",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Botao

            // Texto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _descricao,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 19.6,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _descricaoAdicional,
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 19.6,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
