import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  int n1 = 0;
  int n2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      n1 = 0;
      n2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      n1 = int.parse(output);
      operand = buttonText;
      output = "0";
    } else if (buttonText == ".") {
      if (output.contains(".")) {
          print("Already contains a decimals");
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      n2 = int.parse(output);

      if (operand == "+") {
        output = (n1 + n2).toString();
      }
      if (operand == "-") {
        output = (n1 - n2).toString();
      }
      if (operand == "X") {
        output = (n1 * n2).toString();
      }
      if (operand == "/") {
        output = (n1 / n2).toString();
      }

      n1 = 0;
      n2 = 0;
      operand = "";
    } else {
      output = output + buttonText;
    }

      print(output);


    setState(() {
      output = int.parse(output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child:  OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(24.0)
          ),
          child: Text(buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
          ),
          onPressed: () =>
              buttonPressed(buttonText),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: Text(output,
            style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ))),
          const Expanded(
            child: Divider(),
          ),

           Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ]),

              Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X"),
                  ]),

              Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ]),

              Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ]),

              Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ])
            ])
        ],
      ),
    );
  }

}
