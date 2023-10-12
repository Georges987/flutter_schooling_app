import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController _nameCont = TextEditingController();
  TextEditingController _jobCont = TextEditingController();
  TextEditingController _ageCont = TextEditingController();

  String pres = "";

  void change() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        pres =
            "Mon nom est ${_nameCont.text}. Je suis ${_jobCont.text}. J'ai ${_ageCont.text}.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 10,
              ),
              Text("Ma Présentation")
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _nameCont,
                        decoration: const InputDecoration(
                            hintText: 'Veuillez entrer votre nom',
                            labelText: "Name",
                            icon: Icon(Icons.person)),
                        validator: (value) {
                          return (value == null || value == "")
                              ? "Champs invalide"
                              : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _jobCont,
                        decoration: const InputDecoration(
                            hintText: 'Veuillez entrer votre nom',
                            labelText: "Prefession",
                            icon: Icon(Icons.person)),
                        validator: (value) {
                          return (value == null || value == "")
                              ? "Champs invalide"
                              : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _ageCont,
                        decoration: const InputDecoration(
                            hintText: 'Veuillez entrer votre profession',
                            labelText: "Age",
                            icon: Icon(Icons.date_range)),
                        validator: (value) {
                          return (value == null || value == "")
                              ? "Champs invalide"
                              : null;
                        },
                      ),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    change();
                  },
                  child: const Text("Valider")),
              Text(pres)
            ],
          ),
        ));
  }
}
