import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konvert',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        fontFamily: '',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Conversion Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

double val1 = 0.0;
double val2 = 0.0;
var cur1 = 'INR';
var cur2 = 'USD';

class _MyHomePageState extends State<MyHomePage> {
  double convert() {
    var url = "https://api.exchangeratesapi.io/latest?base=$cur1&symbols=$cur2";
    http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"}).then(
        (r) {
      Map body = json.decode(r.body);
      double temp2 = body['rates'][val1];
      val2 = val1 * temp2;
    });
    return val2;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

TextEditingController _controller = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Currency Converter"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Row(children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Input Value",
              ),
            ),
            DropdownButton<String>(
                value: cur1,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.teal),
                underline: Container(
                  height: 2,
                  color: Colors.tealAccent,
                ),
                onChanged: (String newValue) {
                  {
                    val1 = double.parse(newValue);
                  }
                },
                items: <String>[
                  'CAD',
                  'HKD',
                  'ISK',
                  'PHP',
                  'DKK',
                  'HUF',
                  'CZK',
                  'GBP',
                  'RON',
                  'SEK',
                  'IDR',
                  'INR',
                  'BRL',
                  'RUB',
                  'HRK',
                  'JPY',
                  'THB',
                  'CHF',
                  'EUR',
                  'MYR',
                  'BGN',
                  'TRY',
                  'CNY',
                  'NOK',
                  'NZD',
                  'ZAR',
                  'USD',
                  'MXN',
                  'SGD',
                  'AUD',
                  'ILS',
                  'KRW',
                  'PLN'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })),
          ]),
          FloatingActionButton(
            onPressed: () {
              _controller.text = val2.toString();
              val1 = val2;
              val2 = val1;
            },
          ),
        ],
      ),
    ),
  );
}
