import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required double result,
  })  : _result = result,
        super(key: key);

  final double _result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Hasil",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Text(
            _result.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}