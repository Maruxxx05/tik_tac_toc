import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle customStyle(
          {double fontSize = 16.0,
          Color color = Colors.white,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  int scoreX = 0;
  int scoreO = 0;
  bool turnOf = true;
  int filledBox = 0;
  final List<String> boxes = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(

    appBar: (
      AppBar(
        elevation: 0,
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: (){
            //TODO funcion para resetear el juego
            print('restet');
          }, 
          icon: Icon(Icons.refresh_rounded))          
        ],
      )),
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [_points(),_board(),],
       ));
  }
  Widget _points(){
  return Expanded(
    child: Container(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
                Text(
                    'Jugador O',
                    style: customStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(scoreO.toString(),
                  style: customStyle(fontSize: 22, fontWeight: FontWeight.bold)),
           ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Text(
              'Jugador X',
               style: customStyle(fontSize: 20, fontWeight: FontWeight.w800)
             ),
             const SizedBox(
                    height: 20,
                  ),
                  Text(scoreX.toString(),
                  style: customStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],),
          )
         ],
    ),
  ));
}

Widget _board() {
    return Expanded(

      flex: 3,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(

              onTap: () {
                _tapAction (index);
              },
              child: Container(
                decoration: 
                BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                  child: Text(
                    boxes[index],
                    style: TextStyle(
                      color:boxes [index] == 'x' ? Colors.white : Colors.red, 
                      fontSize: 40),
                  ))),
            );
          },
        ),
      );
}

  void _tapAction(int index) {
    setState(() {
      if (turnOf && boxes[index] == '') {
        boxes[index] = 'o';
        filledBox += 1;
      } else if (!turnOf && boxes[index] == '') {
        boxes[index] = 'x';
        filledBox += 1;
      }

      turnOf = !turnOf;
    });
  }
}