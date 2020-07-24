import 'package:flutter/material.dart';
import 'package:truefalse/brain.dart';


void main() {
  runApp(TrueFalse());
}


class TrueFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {



/*
  List<String> questions = [
    '1st Question ',
    '2nd Question ',
    '3rd Question ',
  ];

  List<bool> answers = [
    true,
    false,
    true,
  ];

  Questions q1 = Questions(q: "1st Question" , a: false);


  List<Questions> truefalsebrain.questionanswerlist = [
    Questions(q: "1st Question" , a: true),
    Questions(q: "1st Question" , a: false),
    Questions(q: "1st Question" , a: true),
  ];

  void questioncounter() {
    setState(() {
      questionnum = questionnum + 1;
    });
  }

*/

  Brain truefalsebrain =  Brain();

  void answercheck(bool userpickedanswer)
  {
    bool correctanswer = truefalsebrain.getanswertext();
    if(correctanswer == userpickedanswer)
      {
        print("Correct Answer");
        ticks.add(Icon(Icons.check ,color:  Colors.green,));
      }
    else
      {
        print("Incorrect Answer");
        ticks.add(Icon(Icons.close ,color:  Colors.red,));
      }
  }


  List<Icon> ticks = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
                child: Text(
                  truefalsebrain.getquestiontext(),
                  textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: (){

                setState(() {
                  truefalsebrain.questioncounter();
                  answercheck(true);
                });
              },
              color: Colors.green,
              child: Text("TRUE",style: TextStyle(color: Colors.white,fontSize: 17),),
            ),
          )),


          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: (){

                setState(() {
                  truefalsebrain.questioncounter();
                  answercheck(false);
                });
              },
              color: Colors.red,
              child: Text("FALSE",style: TextStyle(color: Colors.white,fontSize: 17),),
            ),
          )),
          Row(children: ticks,)
        ],
      ),
    );
  }
}
