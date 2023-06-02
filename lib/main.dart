import 'package:flutter/material.dart';
import 'package:flutter_application_1/BMI/bmi.dart';
import 'package:flutter_application_1/BMI/height_provider.dart';
import 'package:flutter_application_1/BMI/weight_provider.dart';
import 'package:flutter_application_1/FindJob/Providers/auth_provider.dart';
import 'package:flutter_application_1/FindJob/Providers/category_provider.dart';
import 'package:flutter_application_1/FindJob/Providers/job_provider.dart';
import 'package:flutter_application_1/FindJob/Providers/user_provider.dart';
import 'package:flutter_application_1/FindJob/Screen/splash_screen.dart';
import 'package:flutter_application_1/GenderPicker/gender_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/GenderPicker/gender_picker.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GenderProvider()),
      ChangeNotifierProvider(create: (context) => WeightProvider()),
      ChangeNotifierProvider(create: (context) => HeightProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider(create: (context) => JobProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const StartedPage(),
        '/gender_picker': (context) => const GenderPickerPage(),
        '/bmi': (context) => const BmiIndicatorPage(),
        '/job': (context) => const SplashPage(),
      },
    );
  }
}

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementasi Provider State Management'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(
              () {
                Navigator.pushNamed(context, '/gender_picker');
              },
              'Gender Picker',
            ),
            customButton(
              () {
                Navigator.pushNamed(context, '/bmi');
              },
              'BMI Indicator',
            ),
            customButton(
              () {
                Navigator.pushNamed(context, '/job');
              },
              'Future Job',
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(VoidCallback onPressed, String label) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        child: Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
