// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(KramersMethodApp());
}

class KramersMethodApp extends StatelessWidget {
  const KramersMethodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late TextEditingController controllerX1;
  late TextEditingController controllerX2;
  late TextEditingController controllerX3;
  late TextEditingController controllerY1;
  late TextEditingController controllerY2;
  late TextEditingController controllerY3;
  late TextEditingController controllerZ1;
  late TextEditingController controllerZ2;
  late TextEditingController controllerZ3;
  late TextEditingController controllerR1;
  late TextEditingController controllerR2;
  late TextEditingController controllerR3;
  late String errorText;

  @override
  void initState() {
    controllerX2 = TextEditingController();
    controllerX1 = TextEditingController();
    controllerX3 = TextEditingController();
    controllerY1 = TextEditingController();
    controllerY2 = TextEditingController();
    controllerY3 = TextEditingController();
    controllerZ1 = TextEditingController();
    controllerZ2 = TextEditingController();
    controllerZ3 = TextEditingController();
    controllerR1 = TextEditingController();
    controllerR2 = TextEditingController();
    controllerR3 = TextEditingController();
    super.initState();
    errorText = '';
  }

  @override
  Widget build(BuildContext context) {
    var fields = Column(
      children: [
        Text(
          'Матрица',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 100),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'x1', controller: controllerX1),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'y1', controller: controllerY1),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'z1', controller: controllerZ1),
            ),
            SizedBox(width: 15),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'r1', controller: controllerR1),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'x2', controller: controllerX2),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'y2', controller: controllerY2),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'z2', controller: controllerZ2),
            ),
            SizedBox(width: 15),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'r2', controller: controllerR2),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
                flex: 1,
                child:
                    MyTextFormField(hintText: 'x3', controller: controllerX3)),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'y3', controller: controllerY3),
            ),
            SizedBox(width: 5),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'z3', controller: controllerZ3),
            ),
            SizedBox(width: 15),
            Flexible(
              flex: 1,
              child: MyTextFormField(hintText: 'r3', controller: controllerR3),
            ),
          ],
        )
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: SizedBox(), flex: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: fields,
          ),
          Expanded(child: SizedBox(), flex: 2),
          Text(errorText),
          Expanded(child: SizedBox(), flex: 2),
          MaterialButton(
            onPressed: () async {
              int? x1 = int.tryParse(controllerX1.text);
              int? x2 = int.tryParse(controllerX2.text);
              int? x3 = int.tryParse(controllerX3.text);
              int? y1 = int.tryParse(controllerY1.text);
              int? y2 = int.tryParse(controllerY2.text);
              int? y3 = int.tryParse(controllerY3.text);
              int? z1 = int.tryParse(controllerZ1.text);
              int? z2 = int.tryParse(controllerZ2.text);
              int? z3 = int.tryParse(controllerZ3.text);
              int? r1 = int.tryParse(controllerR1.text);
              int? r2 = int.tryParse(controllerR2.text);
              int? r3 = int.tryParse(controllerR3.text);
              if (x1 == null ||
                  x2 == null ||
                  x3 == null ||
                  y1 == null ||
                  y2 == null ||
                  y3 == null ||
                  z1 == null ||
                  z2 == null ||
                  z3 == null ||
                  r1 == null ||
                  r2 == null ||
                  r3 == null) {
                setState(() {
                  errorText = "Неправильные аргументы";
                });
                await Future.delayed(
                    Duration(seconds: 2),
                    () => setState(() {
                          errorText = "";
                        }));
              } else {
                await Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return SolveScreen(
                    x1: x1,
                    x2: x2,
                    x3: x3,
                    y1: y1,
                    y2: y2,
                    y3: y3,
                    z1: z1,
                    z2: z2,
                    z3: z3,
                    r1: r1,
                    r2: r2,
                    r3: r3,
                  );
                }));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Решить',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(child: SizedBox(), flex: 2),
          MaterialButton(
            onPressed: () {
              controllerX1.text = '';
              controllerX2.text = '';
              controllerX3.text = '';
              controllerY1.text = '';
              controllerY2.text = '';
              controllerY3.text = '';
              controllerZ1.text = '';
              controllerZ2.text = '';
              controllerZ3.text = '';
              controllerR1.text = '';
              controllerR2.text = '';
              controllerR3.text = '';
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Отчистить',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(child: SizedBox(), flex: 7),
        ],
      )),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.hintText,
    required this.controller,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      focusNode: FocusNode(descendantsAreFocusable: true),
      keyboardType: TextInputType.numberWithOptions(signed: true),
      decoration: InputDecoration(
        hintText: hintText,
        alignLabelWithHint: true,
      ),
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class SolveScreen extends StatefulWidget {
  const SolveScreen({
    Key? key,
    required this.x1,
    required this.x2,
    required this.x3,
    required this.y1,
    required this.y2,
    required this.y3,
    required this.z1,
    required this.z2,
    required this.z3,
    required this.r1,
    required this.r2,
    required this.r3,
  }) : super(key: key);
  final num x1, x2, x3, y1, y2, y3, z1, z2, z3, r1, r2, r3;
  @override
  State<SolveScreen> createState() => _SolveScreenState();
}

class _SolveScreenState extends State<SolveScreen> {
  late String titleDownText;
  @override
  void initState() {
    //a=[[x1,y1,z1],[x2,y2,z2],[x3,y3,z3]]

    List<List<num>> a = [
      [widget.x1, widget.y1, widget.z1],
      [widget.x2, widget.y2, widget.z2],
      [widget.x3, widget.y3, widget.z3]
    ];
    List<List<num>> b = [
      [widget.r1],
      [widget.r2],
      [widget.r3],
    ];
    num det = a[0][0] * a[1][1] * a[2][2] +
        a[0][1] * a[1][2] * a[2][0] +
        a[1][0] * a[2][1] * a[0][2] -
        a[2][0] * a[1][1] * a[0][2] -
        a[1][0] * a[0][1] * a[2][2] -
        a[0][0] * a[2][1] * a[1][2];
    num deta1 = b[0][0] * a[1][1] * a[2][2] +
        a[0][1] * a[1][2] * b[2][0] +
        b[1][0] * a[2][1] * a[0][2] -
        b[2][0] * a[1][1] * a[0][2] -
        b[1][0] * a[0][1] * a[2][2] -
        b[0][0] * a[2][1] * a[1][2];
    // a01 = r1
    // a11 = r2
    // a21 = r3
    num deta2 = a[0][0] * b[1][0] * a[2][2] +
        b[0][0] * a[1][2] * a[2][0] +
        a[1][0] * b[2][0] * a[0][2] -
        a[2][0] * b[1][0] * a[0][2] -
        a[1][0] * b[0][0] * a[2][2] -
        a[0][0] * b[2][0] * a[1][2];
    num deta3 = a[0][0] * a[1][1] * b[2][0] +
        a[0][1] * b[1][0] * a[2][0] +
        a[1][0] * a[2][1] * b[0][0] -
        a[2][0] * a[1][1] * b[0][0] -
        a[1][0] * a[0][1] * b[2][0] -
        a[0][0] * a[2][1] * b[1][0];
    if (det != 0) {
      num x = deta1 / det;
      num y = deta2 / det;
      num z = deta3 / det;
      titleDownText = "X = $x, Y = $y, Z = $z";
    } else if (det == 0 && deta1 == 0 && deta2 == 0 && deta3 == 0) {
      titleDownText = "Бесконечное множество решений";
    } else {
      titleDownText = "Решений не имеет";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox(), flex: 5),
            Text(
              'Матрица',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(child: SizedBox(), flex: 2),
            Text(
              '${widget.x1} ${widget.y1} ${widget.z1}  | ${widget.r1}',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Text(
              '${widget.x2} ${widget.y2} ${widget.z2}  | ${widget.r2}',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Text(
              '${widget.x3} ${widget.y3} ${widget.z3}  | ${widget.r3}',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 100),
            Text(
              titleDownText,
              style:
                  Theme.of(context).textTheme.headline4?.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Expanded(child: SizedBox(), flex: 2),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Назад',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Expanded(child: SizedBox(), flex: 7),
          ],
        ),
      ),
    );
  }
}
