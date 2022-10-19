import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Navigator',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
              ),
            ),
            ListTile(
              title: const Text(
                "Calcolo paga oraria",
                style: TextStyle(fontSize: 16),
              ),
              leading: const Icon(Icons.euro),
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

  @override
  Widget build(BuildContext context) {
    var ore = 0;
    var tmp2 = 0;
    var minuti = 0;
    var paga = 0;
    var somma = 0.0;
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    hintText: "Minuti",
                    border: OutlineInputBorder(),
                    labelText: "Minuti"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Inserisci un numero";
                  }
                  tmp2 = int.parse(value);
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    hintText: "Paga",
                    border: OutlineInputBorder(),
                    labelText: "Paga"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Inserisci un numero";
                  }
                  paga = int.parse(value);
                  return null;
                }),
          ),
          Text(
            "$somma€",
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
    const appTitle = 'Hours Counter';

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
        ),
        body: const SecondScreenForm(),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Navigator',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.euro),
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

  @override
  Widget build(BuildContext context) {
    var ore = 0;
    var paga = 0;
    var somma = 0.0;
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    hintText: "Stipendio",
                    border: OutlineInputBorder(),
                    labelText: "Stipendio"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Inserisci un numero";
                  }
                  paga = int.parse(value);
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
