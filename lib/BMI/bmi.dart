import 'dart:math';

import 'package:flutter/material.dart';
import 'package:implementasi_provider/BMI/weight_provider.dart';
import 'package:provider/provider.dart';

import 'height_provider.dart';

class BmiIndicatorPage extends StatefulWidget {
  const BmiIndicatorPage({super.key});

  @override
  State<BmiIndicatorPage> createState() => _BmiIndicatorPageState();
}

class _BmiIndicatorPageState extends State<BmiIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Weight (kg):',
              style: TextStyle(fontSize: 20),
            ),
            // Menggunakan Consumer
            // Consumer<WeightProvider>(
            //     builder: (context, weightProvider, _) => Slider(
            //           min: 1,
            //           max: 100,
            //           divisions: 100,
            //           value: weightProvider.weight,
            //           label: weightProvider.weight.round().toString(),
            //           onChanged: (val) {
            //             val = val.roundToDouble();
            //             weightProvider.weight = val;
            //           },
            //         )),
            //Menggunakan Provider.of(context);
            Slider(
              min: 1,
              max: 100,
              divisions: 100,
              value: weightProvider.weight,
              label: weightProvider.weight.round().toString(),
              onChanged: (val) {
                val = val.roundToDouble();
                weightProvider.weight = val;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Height (cm):',
              style: TextStyle(fontSize: 20),
            ),
            // Menggunakan Consumer
            // Consumer<HeightProvider>(
            //     builder: (context, heightProvider, _) => Slider(
            //           min: 1,
            //           max: 200,
            //           value: heightProvider.height,
            //           divisions: 200,
            //           label: heightProvider.height.round().toString(),
            //           activeColor: Colors.pink,
            //           inactiveColor: Colors.pink.withOpacity(0.2),
            //           onChanged: (val) {
            //             val = val.roundToDouble();
            //             heightProvider.height = val;
            //           },
            //         )),
            // Menggunakan Provider.of(context):
            Slider(
              min: 1,
              max: 200,
              value: heightProvider.height,
              divisions: 200,
              label: heightProvider.height.round().toString(),
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
              onChanged: (val) {
                val = val.roundToDouble();
                heightProvider.height = val;
              },
            ),
            const SizedBox(height: 50),
            //Menggunakan Consumer
            // Consumer<WeightProvider>(
            //     builder: (context, weightProvider, child) =>
            //         Consumer<HeightProvider>(
            //             builder: (context, heightProvider, child) => Text(
            //                   'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
            //                   style: const TextStyle(
            //                     fontSize: 24,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                   textAlign: TextAlign.center,
            //                 )))
            // Menggunakan Provider.of(context);
            Text(
              'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
