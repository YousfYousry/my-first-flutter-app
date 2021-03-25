import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'XO GAME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool xTurn = true, gameEnded = false;
  var image = [
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
    'assets/images/empty.png',
  ];

  var op = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  var xO = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

  void reset() => setState(() {
        gameEnded = false;
        xTurn = true;
        image = [
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
          'assets/images/empty.png',
        ];
        xO = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
        op = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
      });

  void _win(index) => setState(() {
        op[index] = 1;
        gameEnded = true;
      });

  void _play(index) => setState(() {
        if (image[index].contains('empty') && !gameEnded) {
          if (xTurn) {
            image[index] = "assets/images/x.png";
            xO[index] = 1;
          } else {
            image[index] = "assets/images/o.png";
            xO[index] = 2;
          }
          checkWin();
          xTurn = !xTurn;
        }
      });

  void checkWin() {
    if (xO[0] > 0 && xO[0] == xO[3] && xO[3] == xO[6]) {
      _win(0);
    } else if (xO[1] > 0 && xO[1] == xO[4] && xO[4] == xO[7]) {
      _win(1);
    } else if (xO[2] > 0 && xO[2] == xO[5] && xO[5] == xO[8]) {
      _win(2);
    } else if (xO[0] > 0 && xO[0] == xO[1] && xO[1] == xO[2]) {
      _win(3);
    } else if (xO[3] > 0 && xO[3] == xO[4] && xO[4] == xO[5]) {
      _win(4);
    } else if (xO[6] > 0 && xO[6] == xO[7] && xO[7] == xO[8]) {
      _win(5);
    } else if (xO[0] > 0 && xO[0] == xO[4] && xO[4] == xO[8]) {
      _win(6);
    } else if (xO[6] > 0 && xO[6] == xO[4] && xO[4] == xO[2]) {
      _win(7);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    var vLine = Image.asset(
      'assets/images/square.png',
      width: 10,
      height: width,
      fit: BoxFit.fill,
    );
    var hLine = Image.asset(
      'assets/images/square.png',
      width: width,
      height: 10,
      fit: BoxFit.fill,
    );

    var lines = [
      vLine,
      vLine,
      vLine,
      hLine,
      hLine,
      hLine,
      Transform.rotate(
        angle: math.pi / 4,
        child: Image.asset(
          'assets/images/square.png',
          width: width * 1.41421356237,
          height: 10,
          fit: BoxFit.fill,
        ),
      ),
      Transform.rotate(
        angle: -math.pi / 4,
        child: Image.asset(
          'assets/images/square.png',
          width: width * 1.41421356237,
          height: 10,
          fit: BoxFit.fill,
        ),
      ),
    ];
    var x = [
      InkWell(
        onTap: () => _play(0),
        child: Image.asset(image[0],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(1),
        child: Image.asset(image[1],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(2),
        child: Image.asset(image[2],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(3),
        child: Image.asset(image[3],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(4),
        child: Image.asset(image[4],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(5),
        child: Image.asset(image[5],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(6),
        child: Image.asset(image[6],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(7),
        child: Image.asset(image[7],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
      InkWell(
        onTap: () => _play(8),
        child: Image.asset(image[8],
            width: (width - 40) / 3,
            height: (width - 40) / 3,
            fit: BoxFit.fill),
      ),
    ];

    // Image.asset('assets/images/empty.png',
    //     width: (width - 40) / 3, height: (width - 40) / 3, fit: BoxFit.fill);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width / 6),
                new Opacity(opacity: op[0], child: lines[0]),
                SizedBox(width: width / 3),
                new Opacity(opacity: op[1], child: lines[1]),
                SizedBox(width: width / 3),
                new Opacity(opacity: op[2], child: lines[2]),
                SizedBox(width: width / 6),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: width / 6),
                new Opacity(opacity: op[3], child: lines[3]),
                SizedBox(height: width / 3),
                new Opacity(opacity: op[4], child: lines[4]),
                SizedBox(height: width / 3),
                new Opacity(opacity: op[5], child: lines[5]),
                SizedBox(height: width / 6),
              ],
            ),
            new Opacity(opacity: op[6], child: lines[6]),
            new Opacity(opacity: op[7], child: lines[7]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/square.png',
                    width: 10, height: width, fit: BoxFit.fill),
                SizedBox(width: width / 3),
                Image.asset('assets/images/square.png',
                    width: 10, height: width, fit: BoxFit.fill),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/square.png',
                    width: width, height: 10, fit: BoxFit.fill),
                SizedBox(height: width / 3),
                Image.asset('assets/images/square.png',
                    width: width, height: 10, fit: BoxFit.fill),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: GridView.count(
                shrinkWrap: true,
                padding: const EdgeInsets.all(25.0),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: [
                  x[0],
                  x[1],
                  x[2],
                  x[3],
                  x[4],
                  x[5],
                  x[6],
                  x[7],
                  x[8],
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: reset,
                  child: Text('Play again'),
                ),
                SizedBox(height: 25),
              ],
            )
          ],
        ),
      ),
    );
  }
}
