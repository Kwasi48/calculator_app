import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userInput = '';
  String  answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        elevation: 2,
        title: const Text('Add Up'),
        centerTitle: true,
      ),
      body:  SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(child: Container(
                child: Column(

                ),
              ))
                ]
          )
        ),
      ),
    );
  }
}
