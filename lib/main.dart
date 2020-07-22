import 'package:flutter/material.dart';

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
              "Questions Will Be Here ",
                  textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: (){
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
