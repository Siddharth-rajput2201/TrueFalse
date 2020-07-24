import 'package:truefalse/question_class.dart';

class Brain{
  int _questionnum = 0;

  List<Questions> questionanswerlist=[
    Questions(q: "1st Question" , a: true),
    Questions(q: "2nd Question" , a: false),
    Questions(q: "3rd Question" , a: true),
  ];

  void questioncounter() {
    if(_questionnum < questionanswerlist.length-1)
      {
        _questionnum = _questionnum+1;
      }
    else
      {
        return;
      }
  }


  String getquestiontext()
  {
    return questionanswerlist[_questionnum].questionstext;
  }


  bool getanswertext()
  {
    return questionanswerlist[_questionnum].questionanswer;
  }


}

