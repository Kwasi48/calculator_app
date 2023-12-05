import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userInput = '';
  String  answer = '';
  List<String> buttons = ['C',
  '+/-',
  '%',
  'DEL',
  '7',
  '8',
  '9',
  '/',
  '4',
  '5',
  '6',
  'x',
  '1',
  '2',
  '3',
  '-',
  '0',
  '.',
  '=',
  '+',];
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(30),
                      child: Text(userInput),
                    ),
                    SizedBox(height: 7,),
                    Container(
                      color: Colors.grey,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(25),
                      child: Text(answer, style: TextStyle(
                        fontSize: 14, fontWeight:FontWeight.bold
                      ),),
                    ),
                    Expanded(
                      flex: 3,
                        child: GridView.builder(
                          itemCount: buttons.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index){
                            // clear Button
                            if ( index == 0){
                              return MyButton(
                                bottontapped:(){
                                  setState(() {
                                    userInput = '';
                                    answer = '0';
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.blue[500],
                                textColor: Colors.black,
                              );
                            }
                            //+/- button
                            else if (index == 1){
                              return MyButton(
                                 buttonText: buttons[index],
                                color: Colors.blue[50],
                                textColor: Colors.black
                              )
                            }
                            // % button
                            else if (index == 2){
                              return MyButton(
                                buttontapped: () {
                                  setState(() {
                                    userInput += buttons[index];
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.blue[50],
                                textColor: Colors.black,
                              );
                            }
                            }))
                  ],
                ),
              ))
                ]
          )
        ),
      ),
    );
  }
}
