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

  final string title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curr = 0;
  void convert(){

  }
}

String convert( int first){

  const url=https://api.exchangeratesapi.io/latest HTTP/1.1

http.get(
  Uri.encodeFull(url),headers:{"Accept":"application/json"}
).then((r){
  Map body =json.decode(r.decode(r.body);
  var res = body["rates"][to])
}
)
)
}

