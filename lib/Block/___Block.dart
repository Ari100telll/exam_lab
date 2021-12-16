// import 'dart:async';
// import 'dart:convert';
// import 'package:rxdart/rxdart.dart';
// import 'package:http/http.dart' as http;

// class FuctBloc {

//   FuctBloc() {
//     _actionController.stream.listen(_increaseStream);
//   }

//   final _counterStream = BehaviorSubject<String>.seeded("Click next page to see content");

//   Stream get pressedCount => _counterStream.stream;
//   Sink get _addValue => _counterStream.sink;

//   StreamController _actionController = StreamController();
//   StreamSink get getBreeds => _actionController.sink;
 

//   void _increaseStream(data) async {
//     final res = await http.get(Uri.parse('https://catfact.ninja/fact'));
//     _addValue.add(jsonDecode(res.body)["fact"]);
//     print(jsonDecode(res.body)["fact"]);
//   }


//   void dispose() {
//     _counterStream.close();
//     _actionController.close();
//   }
// }