import 'package:flutter/material.dart';
import 'package:flutter_dog_model/screen/dog_list.dart';
import 'dog_model.dart';

//https://flutterbyexample.com/reusable-custom-card-widget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDogs = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('We rate dogs'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  // where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // add one stop for each color stops should increase from 0 to 1
                  stops: [
                0.1,
                0.5,
                0.7,
                0.9
              ],
                  colors: [
                // colors are easy thanks to flutters color class.
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400],
              ])),
          child: Center(
            child: DogList(initialDogs), //DogCard(initialDogs[1]), 
          )),
    );
  }
}
