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

  List<Widget> ticks = [];

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
*/
  int questionnum = 0;

  Brain truefalsebrain =  Brain();

  void questioncounter() {
    setState(() {
      questionnum = questionnum + 1;
    });
  }

  void answercheckfortrue()
  {
    bool correctanswer = truefalsebrain.questionanswerlist[questionnum].questionanswer;
    if(correctanswer == true)
      {
        print("Correct Answer");
      }
    else
      {
        print("Incorrect Answer");
      }
  }


  void answercheckfortfalse()
  {
    bool correctanswer = truefalsebrain.questionanswerlist[questionnum].questionanswer;
    if(correctanswer == false)
    {
      print("Correct Answer");
    }
    else
    {
      print("Incorrect Answer");
    }
  }


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
              truefalsebrain.questionanswerlist[questionnum].questionstext,
                  textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: (){
                answercheckfortrue();
                questioncounter();
                setState(() {
                  ticks.add(Icon(Icons.check , color: Colors.green,));
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
                answercheckfortfalse();
                questioncounter();
                setState(() {
                  ticks.add(Icon(Icons.close , color: Colors.red,));
                });
              },
              color: Colors.red,
              child: Text("FALSE",style: TextStyle(color: Colors.white,fontSize: 17),),
            ),
          )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ticks,
            ),
          )
        ],
      ),
    );
  }
}
