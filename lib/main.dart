import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(FatTrack());

class FatTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fat Track',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fat Track'),
        ),
        body: Center(
          child: MetabolicRateCalculator(),
        ),
      ),
    );
  }
}

class MetabolicRateCalculator extends StatefulWidget {
  @override
  MetabolicRateCalculatorState createState() => MetabolicRateCalculatorState();
}

class MetabolicRateCalculatorState extends State<MetabolicRateCalculator> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if(value.isEmpty) return 'You must enter a value';
              return null;
            }
          ),
          ElevatedButton(
            onPressed: () {
              if(formKey.currentState.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing data')));
            },
            child: Text('Submit'),
          )
        ],
      )
    );

    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter your height.'
      ),
    );
  }
}

/*
$('#metabolic-rate-calculator').addEventListener('submit', function(e) {
  e.preventDefault();
  var age = $('#age').value;
  var height = $('#height').value;
  var weight = $('#weight').value;

  if($('#sex-male').checked) var rmr = Math.round(9.99 * weight + 6.25 * height - 4.92 * age + 5);
  else var rmr = Math.round(9.99 * weight + 6.25 * height - 4.92 * age - 161);

  var bmr = Math.round(rmr * 1.2);
  $('#metatbolic-rate').innerHTML = `Your RMR is ${rmr} and BMR is ${bmr}.`;
});
*/