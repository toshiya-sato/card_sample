import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("sample"),
        ),
        body: Row(
          children: [
            Expanded(
                child: Container(
              child: ListView(children: [
                Container(
                  child: ListTile(
                    title: Text("1"),
                    shape: BubbleBorder(),
                    //tileColor: Colors.lightGreen,
                    //subtitle: Text("Sample"),
                    //isThreeLine: true,
                  ),
                ),
                ListTile(
                  title: Text("2"),
                  shape: BubbleBorder(),
                  tileColor: Colors.lightGreen,
                ),
              ]),
              height: double.infinity,
            )),
            Expanded(
                child: Opacity(
              opacity: 0.3,
              child: Container(
                  color: Colors.lightBlue,
                  child: const Text("bbb"),
                  height: double.infinity),
            )),
          ],
        ),
      ),
    );
  }
}

class BubbleBorder extends ShapeBorder {
  final bool usePadding;

  const BubbleBorder({this.usePadding = true});

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 12));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(r, Radius.circular(10)))
      //..addRRect(RRect.fromRectAndRadius(r, Radius.circular(8)))
      ..moveTo(r.centerRight.dx, r.centerRight.dy - 6)
      ..relativeLineTo(10, 6)
      ..relativeLineTo(-10, 6);
    //..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.red;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 12 : 0);
}
