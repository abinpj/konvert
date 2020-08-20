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

class _MyHomePageState extends State<MyHomePage> {
  double val1 = 0.0;
  double val2 = 0.0;
  var cur1 = 'INR';
  var cur2 = 'USD';

  void convert() {
    var url = "https://api.exchangeratesapi.io/latest?base=$cur1";
    http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"}).then(
        (r) {
      Map body = json.decode(r.body);
      val2 = body['rates'][cur2];
      val2 = val1 * val2;
    });
  }

  void send() {}

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: "Input Value",
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            val1 = double.parse(newValue);
                          });

                          convert();
                        }),
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
                        setState(() {
                          cur1 = newValue;
                        });
                        convert();
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
                      }).toList()),
                ]),
            FloatingActionButton(
              child: Icon(IconData(57539, fontFamily: "MaterialIcons")),
              onPressed: () {
                _controller.text = val2.toString();
                val1 = val2;
                convert();
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controller2,
                  onChanged: (String newValue) {
                    setState(() {
                      val2 = double.parse(newValue);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: val2.toString(),
                  ),
                ),
              ),
              DropdownButton<String>(
                  value: cur2,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal),
                  underline: Container(
                    height: 2,
                    color: Colors.tealAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      cur2 = newValue;
                    });
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
                  }).toList()),
            ]),
          ],
        ),
      ),
    );
  }
}
