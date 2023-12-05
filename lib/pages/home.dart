import 'package:flutter/material.dart';
import '../components/button.dart';
import 'package:math_expressions/math_expressions.dart';


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
                                buttontapped:(){
                                  setState(() {
                                    userInput = '';
                                    answer = '0';
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.blue,
                                textColor: Colors.black,
                              );
                            }
                            //+/- button
                            else if (index == 1){
                              return MyButton(
                                 buttonText: buttons[index],
                                color: Colors.blue,
                                textColor: Colors.black
                              );
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
                                color: Colors.blue,
                                textColor: Colors.black,
                              );
                            }
                            //Delete Button
                              else if(index == 3){
                                return MyButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput = userInput.substring(0, userInput.length -1 );
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.blue,
                                  textColor: Colors.black,
                                );
                            }
                              else if (index == 18){
                                return MyButton(
                                  buttontapped: (){
                                    setState(() {
                                      equalPressed();
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.orangeAccent,
                                  textColor: Colors.white,
                                );
                            }
                              else {
                                return MyButton(
                                  buttontapped: (){
                                    setState(() {
                                      userInput += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: isOperator(buttons[index]) ? Colors.blueAccent : Colors.white,
                                  textColor: isOperator(buttons[index]) ? Colors.white : Colors.black,
                                );
                            }
                            }),)
                  ],
                ),
              ))
                ]
          )
        ),
      ),
    );
  }
  bool isOperator(String x){
    if (x == '/' || x == 'x' || x == '+'|| x == '='){
      return true;
    }
    return false;
  }

  void equalPressed(){
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();

  }

}

