import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isInvisible = true;
  String name = "";
  TextEditingController _nameController =
      TextEditingController(text: "Ramón Juan");

  TextEditingController _dateTimeController = TextEditingController();

  List<String> superheroes = [
    "Superman",
    "Wonder Woman",
    "Batmaman",
    "Aquaman"
  ];

  String valueAux = "Superman";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InpuPage"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                maxLines: 1,
                textAlign: TextAlign.start,
                maxLength: 20,
                cursorColor: Colors.deepPurpleAccent,
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  label: const Text("Correo electrónico"),
                  hintText: "Ingresa tu correo electrónico",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.35),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                  icon: Icon(Icons.email),
                  prefixIcon: Icon(Icons.alternate_email),
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                onChanged: (String value) {
                  print(value);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Buscar producto",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  enabled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurpleAccent,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 4.0,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mail),
                  prefixIcon: Icon(Icons.check_circle_outline),
                  label: Text("Buscar"),
                  hintText: "Ingresa el producto a buscar...",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.deepPurpleAccent,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.deepPurpleAccent,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Buscar producto...",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.black.withOpacity(0.37),
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.4),
                            offset: const Offset(4, 4),
                            blurRadius: 7.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                obscureText: isInvisible,
                decoration: InputDecoration(
                  hintText: "Ingrese su contraseña",
                  suffixIcon: IconButton(
                    icon: isInvisible
                        ? Icon(Icons.remove_red_eye)
                        : Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                    onPressed: () {
                      isInvisible = !isInvisible;
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  label: Text(
                    "Ingresa tu nombre",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getNameData();
                  setState(() {});
                },
                child: const Text("Mostrar valor!"),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _dateTimeController,
                toolbarOptions: ToolbarOptions(
                  copy: false,
                  cut: false,
                  paste: false,
                  selectAll: false,
                ),
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Fecha de nacimiento",
                  suffixIcon: Icon(Icons.date_range),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  selectDate();
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              DropdownButton(
                value: valueAux,
                // items: getDataSuperheroe(),
                items: superheroes
                    .map((String e) =>
                        DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                onChanged: (String? value) {
                  print(value);
                  //valueAux = value.;
                  valueAux = value!;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getNameData() {
    print(_nameController.text);
  }

  selectDate() async {
    DateTime? dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (dateSelected != null) {
      _dateTimeController.text = dateSelected.toString().substring(0, 10);
    }
  }

  List<DropdownMenuItem<String>> getDataSuperheroe() {
    List<DropdownMenuItem<String>> items = [];

    superheroes.forEach((element) {
      items.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        ),
      );
    });

    return items;
  }
}
