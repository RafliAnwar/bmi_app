import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        backgroundColor: Colors.purple[200],
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Weight (kg):',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // NOTE: DENGAN CONSUMER
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Slider(
            //       activeColor: Colors.amber,
            //       inactiveColor: Colors.amber.withOpacity(0.2),
            //       max: 100,
            //       min: 1,
            //       divisions: 100,
            //       label: weightProvider.weight.round().toString(),
            //       value: weightProvider.weight,
            //       onChanged: (newValue) {
            //         newValue = newValue.roundToDouble();
            //         print('weight: $newValue');
            //         weightProvider.weight = newValue;
            //       }),
            // ),
            //NOTE : DENGAN Provider.of()
            Slider(
                activeColor: Colors.amber,
                inactiveColor: Colors.amber.withOpacity(0.2),
                max: 100,
                min: 1,
                divisions: 100,
                label: weightProvider.weight.round().toString(),
                value: weightProvider.weight,
                onChanged: (newValue) {
                  newValue = newValue.roundToDouble();
                  print('weight: $newValue');
                  weightProvider.weight = newValue;
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your Height (cm):',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // NOTE : DENGAN CONSUMER
            // Consumer<HeightProvider>(
            //   builder: (context, heightProvider, _) => Slider(
            //       activeColor: Colors.purple,
            //       inactiveColor: Colors.purple.withOpacity(0.2),
            //       max: 200,
            //       min: 1,
            //       divisions: 100,
            //       label: heightProvider.height.round().toString(),
            //       value: heightProvider.height,
            //       onChanged: (newValue) {
            //         newValue = newValue.roundToDouble();
            //         print('height: $newValue');
            //         heightProvider.height = newValue;
            //       }),
            // ),
            //NOTE: DENGAN Provider.of()
            Slider(
                activeColor: Colors.purple,
                inactiveColor: Colors.purple.withOpacity(0.2),
                max: 200,
                min: 1,
                divisions: 100,
                label: heightProvider.height.round().toString(),
                value: heightProvider.height,
                onChanged: (newValue) {
                  newValue = newValue.roundToDouble();
                  print('height: $newValue');
                  heightProvider.height = newValue;
                }),
            SizedBox(
              height: 50,
            ),
            //NOTE : DENGAN CONSUMER
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Consumer<HeightProvider>(
            //     builder: (context, heightProvider, _) => Text(
            //       'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
            //       style: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // )
            //NOTE: Dengan Provider.of()
            Text(
              'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
