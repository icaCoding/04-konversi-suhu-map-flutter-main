import 'package:flutter/material.dart';
import 'package:praktikum4/widget/ListHasil.dart';
import 'package:praktikum4/widget/input.dart';
import 'package:praktikum4/widget/dropdown.dart';
import 'package:praktikum4/widget/Result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List listHasil = [];
  var listSatuanSuhu = ['Kelvin', 'Reamur'];

  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _inputUser = 0;
  double _result = 0;

  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2031710127 Neha Viranica Nauly',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Konversi Suhu\n2031710127 Neha Viranica Nauly"),
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Input(inputController: inputController),
                Dropdown(
                  listSatuanSuhu: listSatuanSuhu,
                  newValue: _newValue,
                  onDropdownChange: onDropdownChange,
                ),
                Result(result: _result),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      'Riwayat Konversi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ListHasil(listHasil: listHasil)
              ],
            ),
          )),
    );
  }
}