import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

enum DialogAction { yes, no }

class _MyHomePageState extends State<MyHomePage> {
  String inputValue = "";
  String result = '';
  void alertResult(DialogAction result) {
    setState(() {
      this.result = result == DialogAction.yes ? 'SI' : 'NO';
    });
    Navigator.of(context, rootNavigator: true).pop();
  }

  void showAlert(String value) {
    AlertDialog dialog = AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(
            child: Text("Si"),
            onPressed: () {
              alertResult(DialogAction.yes);
            }),
        FlatButton(
          child: Text("No"),
          onPressed: () {
            alertResult(DialogAction.no);
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void onChanged(String value) {
    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Alert Dialog"),
      ),
      body: Container(
          child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: "Ingrese el texto"),
          onChanged: onChanged,
        ),
        RaisedButton(
            child: Text("Ver Alerta"),
            onPressed: () {
              showAlert(inputValue);
            }),
        Text('Resultado:' + this.result )
      ])),
    );
  }
}
