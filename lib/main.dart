import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class SecondScreenForm extends StatefulWidget {
  const SecondScreenForm({super.key});

  @override
  SecondScreenFormState createState() {
    return SecondScreenFormState();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Routes', initialRoute: '/', routes: {
      '/': (context) => const First(),
      '/second': (context) => const Second(),
    });
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Hours Counter';

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 100, top: -20),
                child: Text(
                  'Navigator',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Calcolo schiavitù",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Second()),
                );
              },
            ),
          ]),
        ));
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  int ore = 0;
  int tmp = 0;
  int tmp2 = 0;
  int minuti = 0;
  int tmp3 = 0;
  int paga = 0;
  double somma = 0;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Ore",
                border: OutlineInputBorder(),
                labelText: "Ore",
              ),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null) {
                  return "Inserisci un numero";
                }
                ore = int.parse(value);
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Minuti",
                    border: OutlineInputBorder(),
                    labelText: "Minuti"),
                validator: (value) {
                  tmp2 = int.parse(value!);
                  if (tmp2 < 0 || tmp2 > 59) {
                    return "Inserisci un numero valido";
                  } else {
                    minuti = tmp2;
                  }
                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Paga",
                    border: OutlineInputBorder(),
                    labelText: "Paga"),
                validator: (value) {
                  paga = int.parse(value!);
                  return null;
                }),
          ),
          Text(
            "$somma",
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    somma += (paga * ore) + (minuti * (paga / 60));
                  }
                });
                // Validate returns true if the form is valid, or false otherwise.
              },
              child: const Text('Calcola'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  somma = 0;
                });
                // Validate returns true if the form is valid, or false otherwise.
              },
              child: const Text('Azzera'),
            ),
          ),
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Hours';

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
        ),
        body: const SecondScreenForm(),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 100, top: -20),
                child: Text(
                  'Navigator',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Calcolo stipendio",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ]),
        ));
  }
}

class SecondScreenFormState extends State<SecondScreenForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var ore = 0;
  var tmp = 0;
  var paga = 0;
  var somma = 0.0;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Ore settimanali",
                border: OutlineInputBorder(),
                labelText: "Ore settimanali",
              ),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null) {
                  return "Inserisci un numero";
                }
                ore = int.parse(value) * 4;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Stipendio",
                    border: OutlineInputBorder(),
                    labelText: "Stipendio"),
                validator: (value) {
                  paga = int.parse(value!);
                  return null;
                }),
          ),
          Text(
            "$somma€ l'ora",
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    somma = (paga / ore);
                  }
                });
                // Validate returns true if the form is valid, or false otherwise.
              },
              child: const Text('Calcola'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  somma = 0;
                });
                // Validate returns true if the form is valid, or false otherwise.
              },
              child: const Text('Azzera'),
            ),
          ),
        ],
      ),
    );
  }
}
