import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Tip Calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final billTextField = TextEditingController();
  bool isSwitched = false;

  double _standardTip = 0.15;
  double _outstandingTip = 0.20;
  double _billAmount = 0;
  double _tip = 0;
  String _totalTip = "";


  void _calculateTip()
  {
    setState(() {
    if(isSwitched == false)
      {
        _totalTip = "Total Tip: ";
        _billAmount = double.parse(billTextField.text);
        _tip = _billAmount*_standardTip;
        _totalTip += _tip.toString();
      }
    else if(isSwitched == true)
      {
        _totalTip = "Total Tip: ";
        _billAmount = double.parse(billTextField.text);
        _tip = _billAmount*_outstandingTip;
        _totalTip += _tip.toString();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tip Calculator", style: Theme.of(context).textTheme.headlineMedium,),
            Text("Bill Amount"),
            TextField(controller: billTextField,),

            Row(
              children: [
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                Text("Great Service?"),
              ],
            ),

            ElevatedButton(
                onPressed: () {
                  print("Calculate tip button pressed.");
                  _calculateTip();
                },
                child: Text("Calculate Tip")),

            Text(_totalTip),
          ],
        ),
      ),
    );
  }
}
