import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MeasuresConverter();
    throw UnimplementedError();
  }
}

class MeasuresConverter extends State<Converter> {
  late double _numberFrom;
  String _startMeasure = 'meters';
  String _convertedMeasure = 'meters';

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  final Map<String, dynamic> _measuresMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  String _resultMessage = '';

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                //Spacer(),
                Text(
                  "Value",
                  style: labelStyle,
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: inputStyle,
                  decoration: InputDecoration(
                    hintText: "Please insert the measure to be converted",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.blue), //<-- SEE HERE
                    ),
                  ),
                  onChanged: (value) {
                    var rv = double.tryParse(value);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
                SizedBox(height: 20),

                Text(
                  'From',
                  style: labelStyle,
                ),

                SizedBox(height:10),

                DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.cyan),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 0.0),
                    child: DropdownButton(
                      value: _startMeasure,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _measures.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _startMeasure = newValue!;
                          //print(_startMeasure);
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height:20),

                Text(
                  'To',
                  style: labelStyle,
                ),

                SizedBox(height:10),
                
                
                 DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.cyan),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 0.0),
                    child: DropdownButton(
                      value: _convertedMeasure,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _measures.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _convertedMeasure = newValue!;
                          print(_convertedMeasure);
                        });
                      },
                    ),
                  ),
                ),


                SizedBox(height:20),

                MaterialButton(
                  color: Color.fromARGB(255, 116, 191, 232),
                  child: Text('Convert', style: inputStyle),
                  onPressed: () {
                    if (_startMeasure.isEmpty ||
                        _convertedMeasure.isEmpty) {
                      return;
                    } else {
                      //  print(_numberFrom);
                      // print(_startMeasure);
                      // print(_convertedMeasure);
                      if(_numberFrom==0)
                      {
                        setState(() {
                          _resultMessage='Please enter a value';
                        });
                      }
                      else{
                        convert(_numberFrom, _startMeasure, _convertedMeasure);

                      }
                      
                    }
                  },
                ),

                SizedBox(height:30),

                 Text(_resultMessage, style: labelStyle),
                
              ],
            ),
          )),
        ),
      ),
    );
    throw UnimplementedError();
  }

  void convert(double value, String from, String to) {
    int? fromIndex = _measuresMap[from];
    int? toIndex = _measuresMap[to];

    var multiplier = _formulas[fromIndex.toString()][toIndex];
    double result = multiplier * value;

    if (result == 0) {
      _resultMessage = 'This conversion cannot be performed';
    } else {
      _resultMessage =
          '${_numberFrom.toString()} $_startMeasure are ${result.toString()} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }
}
