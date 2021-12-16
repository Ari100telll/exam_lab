import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  List buttons = [
    {"text": "X", "visible": false, "is_furst_button": false, "position": 0},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 1},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 2},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 3},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 4},
    {"text": "X", "visible": false, "is_furst_button": true, "position": 5},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 6},
    {"text": "X", "visible": true, "is_furst_button": false, "position": 7},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 8},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 9},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 10},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 11},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 12},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 13},
    {"text": "X", "visible": false, "is_furst_button": false, "position": 14},
  ];

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }
  List _change_button_position(button) {
    print(button);
    var buttons_local = buttons;
    var cnt = 0;
    for (var btn in buttons) {
      if (btn["visible"]) {
        cnt++;
      }
    }
    if (cnt != 15) {
      var rnd = new Random();
      var new_position = rnd.nextInt(15);
      var old_pos = button["position"];
      while (
          new_position == old_pos || buttons_local[new_position]["visible"] == true) {
        new_position = rnd.nextInt(15);
      }
    print(new_position);
    buttons_local[new_position]["visible"]=true;
    buttons_local[new_position]["is_furst_button"] = button["is_furst_button"];
    buttons_local[old_pos]["visible"]=false;
    buttons_local[new_position]["is_furst_button"] = false;
    print(buttons_local);
    cnt+=1;
    if(cnt != 15 && rnd.nextInt(5)==3){
      var new_rand_button_position = rnd.nextInt(15);
      while (buttons[new_rand_button_position]["visible"] == true) {
        new_rand_button_position = rnd.nextInt(15);
      }
      buttons_local[new_rand_button_position]["visible"]==true;
      buttons_local[new_rand_button_position]["is_furst_button"] =false;
    }
    }
    return buttons_local;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        //  height: 200,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,

          // Generate 100 widgets that display their index in the List.
          children: buttons
              .map(
                (e) => e["visible"]
                    ? Container(
                        width: 100,
                        child: FloatingActionButton(
                          onPressed: () {
                            var new_buttons = _change_button_position(e);
                            setState(() {
                              buttons = new_buttons;
                            });
                          },
                          tooltip: 'Increment',
                          child: Text(e["text"]),
                        ),
                      )
                    : Text(" "),
              )
              .toList(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
